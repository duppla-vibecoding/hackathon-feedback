-- Hackathon Feedback - Setup SQL
-- Ejecutar en Supabase SQL Editor o via CLI

-- Tabla principal
CREATE TABLE IF NOT EXISTS hackathon_feedback (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  nombre TEXT,
  equipo TEXT CHECK (equipo IN ('Principiantes', 'Avanzados', 'Equipo Virtual')),
  satisfaccion_general INTEGER CHECK (satisfaccion_general BETWEEN 1 AND 5),
  rating_organizacion INTEGER CHECK (rating_organizacion BETWEEN 1 AND 5),
  rating_ejecucion INTEGER CHECK (rating_ejecucion BETWEEN 1 AND 5),
  rating_aprendizaje INTEGER CHECK (rating_aprendizaje BETWEEN 1 AND 5),
  comentarios_adicionales TEXT
);

-- RLS: permitir inserts y selects anonimos (formulario publico interno)
ALTER TABLE hackathon_feedback ENABLE ROW LEVEL SECURITY;

CREATE POLICY "allow_anonymous_insert" ON hackathon_feedback
  FOR INSERT WITH CHECK (true);

CREATE POLICY "allow_anonymous_select" ON hackathon_feedback
  FOR SELECT USING (true);
