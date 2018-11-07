class RiesgosDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Riesgo.id", cond: :eq },
      descripcion: { source: "Riesgo.descripcion", cond: :like },
      risk_source_name: { source: "Riesgo.risk_source_id", cond: :eq },
      risk_proceso_name: { source: "Riesgo.proceso_id", cond: :eq },
    }
  end

  def data
    records.map do |record|
      {
        # example:
         id: record.id,
         descripcion: record.descripcion,
         risk_source_name: record.risk_source.try(:name),
         risk_proceso_name: record.proceso.try(:name),
      }
    end
  end

  def get_raw_records
    # insert query here
     Riesgo.all.includes(:proceso).includes(:risk_source)

  end

end






