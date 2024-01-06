module PlansHelper

    def part_type(part)
        part_type = PartType.find_by(id: part.part_type_id)
        part_type.kind
    end
end