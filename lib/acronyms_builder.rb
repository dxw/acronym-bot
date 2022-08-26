require "active_support/core_ext/object/blank"

def acronym_dictionary(glossary_contents)
  # reject entries with no acronym (entry[2]) or no definition (entry[1])
  glossary_contents = glossary_contents.reject { |entry| entry[1]&.strip.blank? || entry[2]&.strip.blank? }

  # arrange the entries as a hash of ACRONYM => Definition pairs
  glossary_contents.map { |entry| [entry[2].strip, entry[1].strip] }.to_h
end
