module ApplicationHelper
  def title(page_title)
    page_title += ' - '
    content_for(:title) { page_title }
  end

  def count_entries_drl(department, research_line)
    count_e = 0
    exclude = Array.new
    for entry in department.entries
      if entry.research_lines.include?(research_line)
        count_e += 1
        exclude << entry
      end
    end
  end

  def count_programs_drl(department, research_line)
    count_pr = 0
    exclude = Array.new
    for program in department.programs
      for research_subline in program.research_sublines
        if research_subline.research_line == research_line && !exclude.include?(program)
          exclude << program
          count_pr += 1
        end
      end
    end
    count_pr
  end

  def count_projects_drl(department, research_line)
    count_pj = 0
    exclude = Array.new
    for project in department.projects
      for research_subline in project.research_sublines
        if research_subline.research_line == research_line && !exclude.include?(project)
          exclude << project
          count_pj += 1
        end
      end
    end
    count_pj
  end
end
