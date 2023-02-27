local ls = require "luasnip"
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.config.set_config {
  history = true,
  -- treesitter-hl has 100, use something higher (default is 200).
  ext_base_prio = 200,
  -- minimal increase in priority.
  ext_prio_increase = 1,
  enable_autosnippets = false,
  store_selection_keys = "<c-s>"
}

local date = function()
  return { os.date "%Y-%m-%d" }
end

local filename = function()
  return { vim.fn.expand "%:p" }
end

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
  local file = io.popen(command, "r")
  local res = {}
  for line in file:lines() do table.insert(res, line) end
  return res
end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "date",
      namr = "Date",
      dscr = "Date in the form of YYYY-MM-DD"
    }, {
      func(date, {})
    }),
    snip({
      trig = "pwd",
      namr = "PWD",
      dscr = "Path to current working directory"
    }, {
      func(bash, {}, { user_args = { "pwd" } })
    }),
    snip({
      trig = "filename",
      namr = "Filename",
      dscr = "Absolute path to file"
    }, {
      func(filename, {})
    }),
    snip({
      trig = "signature",
      namr = "Signature",
      dscr = "Name and Surname"
    }, {
      text "Sergei Bulavintsev", insert(0)
    })
  },
  sh = {
    snip("shebang", {
      text { "#!/bin/sh", "" }, insert(0)
    })
  },
  python = {
    snip("shebang", {
      text { "#!/usr/bin/env python", "" }, insert(0)
    })
  },
  lua = {
    snip("shebang", {
      text { "#!/usr/bin/lua", "", "" }, insert(0)
    }),
    snip("req", {
      text "require('", insert(1, "Module-name"), text "')", insert(0)
    }),
    snip("func", {
      text "function(", insert(1, "Arguments"), text { ")", "\t" }, insert(2),
      text { "", "end", "" }, insert(0)
    }),
    snip("forp", {
      text "for ", insert(1, "k"), text ", ", insert(2, "v"), text " in pairs(",
      insert(3, "table"), text { ") do", "\t" }, insert(4), text { "", "end", "" },
      insert(0)
    }),
    snip("fori", {
      text "for ", insert(1, "k"), text ", ", insert(2, "v"),
      text " in ipairs(", insert(3, "table"), text { ") do", "\t" }, insert(4),
      text { "", "end", "" }, insert(0)
    }),
    snip("if", {
      text "if ", insert(1), text { " then", "\t" }, insert(2),
      text { "", "end", "" }, insert(0)
    }),
    snip("M", {
      text { "local M = {}", "", "" }, insert(0), text { "", "", "return M" }
    })
  },
  markdown = {
    -- Select link, press C-s, enter link to receive snippet
    snip({
      trig = "link",
      namr = "markdown_link",
      dscr = "Create markdown link [txt](url)"
    }, {
      text "[", insert(1), text "](", func(function(_, snip)
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}), text ")", insert(0)
    }),
    snip({
      trig = "codewrap",
      namr = "markdown_code_wrap",
      dscr = "Create markdown code block from existing text"
    }, {
      text "``` ", insert(1, "Language"), text { "", "" }, func(function(_, snip)
        local tmp = {}
        tmp = snip.env.TM_SELECTED_TEXT
        tmp[0] = nil
        return tmp or {}
      end, {}), text { "", "```", "" }, insert(0)
    }),
    snip({
      trig = "codeempty",
      namr = "markdown_code_empty",
      dscr = "Create empty markdown code block"
    }, {
      text "``` ", insert(1, "Language"), text { "", "" }, insert(2, "Content"),
      text { "", "```", "" }, insert(0)
    }),
    snip({
      trig = "meta",
      namr = "Metadata",
      dscr = "Yaml metadata format for markdown"
    }, {
      text { "---", "title: " }, insert(1, "note_title"), text { "", "author: " },
      insert(2, "author"), text { "", "date: " }, func(date, {}),
      text { "", "cathegories: [" }, insert(3, ""), text { "]", "lastmod: " },
      func(date, {}), text { "", "tags: [" }, insert(4),
      text { "]", "comments: true", "---", "" }, insert(0)
    }),
    snip({
      trig = "prem",
      namr = "Premis",
      dscr = "Premis Outline"
    }, {
      text { "# Premis", "" }, insert(1, ""),
      text { "# Protagonis", "", "- Nama:", "  - " }, insert(2, ""),
      text { "", "  - Fisiologis", "  - " }, insert(3, ""),
      text { "", "  - Sosiologis", "  - " }, insert(4, ""),
      text { "", "  - Psikologis", "  - " }, insert(5, ""),
      text { "# Problem", "" }, insert(6, ""),
      text { "# Want", "" }, insert(7, ""),
      text { "# Need", "" }, insert(8, ""),
    }),
    snip({
      trig = "ol",
      namr = "Outline",
      dscr = "Outline"
    }, {
      text { "[[toc]]", "# ACT 1", "## " }, insert(1, ""),
      text { "", "### Opening Image", "## " }, insert(2, ""),
      text { "", "### Theme Stated", "## " }, insert(3, ""),
      text { "", "### Setup", "## " }, insert(4, ""),
      text { "", "### Katalis", "## " }, insert(5, ""),
      text { "", "### Debat", "", "# ACT 2", "## " }, insert(6, ""),
      text { "", "### Break into Two", "## " }, insert(7, ""),
      text { "", "### B-Story", "## " }, insert(8, ""),
      text { "", "### Fun & Games", "## " }, insert(9, ""),
      text { "", "### Midpoint", "## " }, insert(10, ""),
      text { "", "### Bad Guys Close into", "## " }, insert(11, ""),
      text { "", "### All is Lost", "## " }, insert(12, ""),
      text { "", "### Dark Night of the Soul", "", "# ACT 3", "## " }, insert(13, ""),
      text { "", "### Break into Three", "## " }, insert(14, ""),
      text { "", "### Klimaks/Finale", "## " }, insert(15, ""),
      text { "", "### Final Image" },
    }),
    snip({
      trig = 'chnm',
      namr = "Character Name",
      dscr = "Character Name Data"
    }, {
      text { "# Nama", "", "- Nama Lengkap", "  - " }, insert(1, ""),
      text { "", "- Gelar", "  - " }, insert(2, ""),
      text { "", "- Nama Panggilan", "  - " }, insert(3, "")
    }),
    snip({
      trig = 'chlk',
      namr = 'Character Looks',
      dscr = "Character Looks Data"
    }, {
      text { "# Penampilan", "", "- Jenis Kelamin", "  - " }, insert(1, ""),
      text { "", "- Postur Tubuh", "  - " }, insert(2, ""),
      text { "", "- Berat Badan", "  - " }, insert(3, ""),
      text { "", "- Tinggi Badan", "  - " }, insert(4, ""),
      text { "", "- Ciri Khas", "  - " }, insert(5, ""),
      text { "", "- Warna Rambut", "  - " }, insert(6, ""),
      text { "", "- Gaya Rambut", "  - " }, insert(7, ""),
      text { "", "- Warna Mata", "  - " }, insert(8, ""),
      text { "", "- Kacamata/Lensa Kontak", "  - " }, insert(9, "")
    }),
    snip({
      trig = 'chdt',
      namr = "Character Personal Details",
      dscr = "Character Personal Details Data"
    }, {
      text { "# Detil Pribadi", "", "- Tanggal Lahir", "  - " }, insert(1, ""),
      text { "", "- Zodiak", "  - " }, insert(2, ""),
      text { "", "- Kewarganegaraan", "  - " }, insert(3, ""),
      text { "", "- Agama", "  - " }, insert(4, ""),
      text { "", "- Pandangan Politik", "  - " }, insert(5, ""),
      text { "", "- Riwayat Kesehatan", "  - " }, insert(6, ""),
      text { "", "- Kekayaan", "  - " }, insert(7, "")
    }),
    snip({
      trig = "chpr",
      namr = "Character Personality",
      dscr = "Character Personality Data"
    }, {
      text { "# Kepribadian", "", "- Selera Berpakaian", "  - " }, insert(1, ""),
      text { "", "- Perhiasan", "  - " }, insert(2, ""),
      text { "", "- Kosmetik", "  - " }, insert(3, ""),
      text { "", "- Perlengkapan Mandi", "  - " }, insert(4, ""),
      text { "", "- Waran Favorit", "  - " }, insert(5, ""),
      text { "", "- Makanan Favorit", "  - " }, insert(6, ""),
      text { "", "- Minuman Favorit", "  - " }, insert(7, ""),
      text { "", "- Musik Favorit", "  - " }, insert(8, ""),
      text { "", "- Film Favorit", "  - " }, insert(9, ""),
      text { "", "- Buku Favorit", "  - " }, insert(10, ""),
      text { "", "- Penulis Favorit", "  - " }, insert(11, ""),
      text { "", "- Pilihan Koran dan Majalah", "  - " }, insert(12, ""),
      text { "", "- Karakteristik", "  - " }, insert(13, ""),
      text { "", "- Filosofi Pribadi", "  - " }, insert(14, ""),
      text { "", "- Ekspresi Verbal", "  - " }, insert(15, ""),
      text { "", "- Bakat & Kekuatan", "  - " }, insert(16, ""),
      text { "", "- Kelemahan", "  - " }, insert(17, ""),
      text { "", "- Kebiasaan", "  - " }, insert(18, ""),
      text { "", "- Ambisi Pribadi", "  - " }, insert(19, ""),
      text { "", "- Ketakutan", "  - " }, insert(20, ""),
    }),
    snip({
      trig = "chrl",
      namr = "Character Relations",
      dscr = "Character Relations Data"
    }, {
      text { "# Relasi", "", "- Teman", "  - " }, insert(1, ""),
      text { "", "- Musuh", "  - " }, insert(2, ""),
      text { "", "- Peliharaan", "  - " }, insert(3, ""),
      text { "", "- Peliharaan Membenci", "  - " }, insert(4, ""),
      text { "", "- Sedang dalam Hubungan", "  - " }, insert(5, ""),
      text { "", "- Anak", "  - " }, insert(6, ""),
    }),
    snip({
      trig = "chav",
      namr = "Character Activities",
      dscr = "Character Activities Data"
    }, {
      text { "# Aktivitas", "", "- Hobi & Aktivitas", "  - " }, insert(1, ""),
      text { "", "- Keanggotaan", "  - " }, insert(2, ""),
      text { "", "- Minat", "  - " }, insert(3, ""),
      text { "", "- Malam Hari Ideal", "  - " }, insert(4, ""),
      text { "", "- Hari Libur Ideal", "  - " }, insert(5, ""),
    }),
    snip({
      trig = "chbg",
      namr = "Character Background",
      dscr = "Character Background Data"
    }, {
      text { "# Latar Belakang Keluarga", "", "- Orang Tua", "  - " }, insert(1, ""),
      text { "", "  - Ayah", "    - " }, insert(2, ""),
      text { "", "  - Ibu", "    - " }, insert(3, ""),
      text { "", "- Hubungan dengan Orang Tua", "  - " }, insert(4, ""),
      text { "", "- Saudara Kandung", "  - " }, insert(5, ""),
      text { "", "- Hubungan dengan Saudara Kandung", "  - " }, insert(6, ""),
      text { "", "- Kampung Halaman", "  - " }, insert(7, ""),
      text { "", "- Deskripsi Rumah Masa Kecil", "  - " }, insert(8, ""),
      text { "", "- Kehidupan Anak-Anak", "  - " }, insert(9, ""),
      text { "", "- Kehidupan Remaja", "  - " }, insert(10, ""),
    }),
    snip({
      trig = "chhm",
      namr = "Character Home",
      dscr = "Character Home Data"
    }, {
      text { "# Rumah", "", "- Alamat", "  - " }, insert(1, ""),
      text { "", "- Penghuni", "  - " }, insert(2, ""),
      text { "", "- Deskripsi Jenis Agen Perumahan", "  - " }, insert(3, ""),
      text { "", "- Deskripsi Eksterior Depan", "  - " }, insert(4, ""),
      text { "", "- Deskripsi Eksterior Belakang", "  - " }, insert(5, ""),
      text { "", "- Deskripsi Pintu Masuk Utama", "  - " }, insert(6, ""),
      text { "", "- Deskripsi Lantai Dasar", "  - " }, insert(7, ""),
      text { "", "- Deskripsi Lantai Bawah Tanah", "  - " }, insert(8, ""),
      text { "", "- Deskripsi Lantai Atas", "  - " }, insert(9, ""),
      text { "", "- Gaya Perabotan", "  - " }, insert(10, ""),
      text { "", "- Perabotan Khusus", "  - " }, insert(11, ""),
    }),
    snip({
      trig = "chcr",
      namr = "Character Career",
      dscr = "Character Career Data"
    }, {
      text { "# Karir", "", "- Pendidikan", "  - " }, insert(1, ""),
      text { "", "- Keahlian", "  - " }, insert(2, ""),
      text { "", "- Pekerjaan Saat Ini", "  - " }, insert(3, ""),
      text { "", "- Tanggal Mulai Kerja", "  - " }, insert(4, ""),
      text { "", "- Kewajiban", "  - " }, insert(5, ""),
      text { "", "- Orang yang bertanggung jawab untuk", "  - " }, insert(6, ""),
      text { "", "- Orang yang bertanggung jawab kepada", "  - " }, insert(7, ""),
      text { "", "- Perasaan tentang Pekerjaan", "  - " }, insert(8, ""),
      text { "", "- Ambisi Karir", "  - " }, insert(9, ""),
      text { "", "- Pekerjaan Sebelumnya", "  - " }, insert(10, ""),
      text { "", "- Alamat Tempat Kerja", "  - " }, insert(11, ""),
      text { "", "- Deskripsi Eksterior", "  - " }, insert(12, ""),
      text { "", "- Deskripsi Pintu Masuk", "  - " }, insert(13, ""),
      text { "", "- Deskripsi Ruang Kerja", "  - " }, insert(14, ""),
      text { "", "- Deskripsi Kantin", "  - " }, insert(15, ""),
    }),
    snip({
      trig = "chex",
      namr = "Character Extras",
      dscr = "Character Extras Data"
    }, {
      text { "# Extras", "", "- Kendaraan", "  - " }, insert(1, ""),
      text { "", "- Keahlian/Keterampilan (misal Senjata)", "  - " }, insert(2, ""),
      text { "", "- Alat Tertentu yang Dimiliki", "  - " }, insert(3, ""),
    }),
    snip({
      trig = "todo",
      namr = "TODO Comment",
      dscr = "Add TODO Comment"
    }, { text { "<!-- TODO: " }, insert(1, ""), text(" -->") }),
    snip({
      trig = "hack",
      namr = "HACK Comment",
      dscr = "Add HACK Comment"
    }, { text { "<!-- HACK: " }, insert(1, ""), text(" -->") }),
    snip({
      trig = "warn",
      namr = "WARN Comment",
      dscr = "Add WARN Comment"
    }, { text { "<!-- WARN: " }, insert(1, ""), text(" -->") }),
    snip({
      trig = "perf",
      namr = "PERF Comment",
      dscr = "Add PERF Comment"
    }, { text { "<!-- PERF: " }, insert(1, ""), text(" -->") }),
    snip({
      trig = "note",
      namr = "NOTE Comment",
      dscr = "Add NOTE Comment"
    }, { text { "<!-- NOTE: " }, insert(1, ""), text(" -->") }),
    snip({
      trig = "test",
      namr = "TEST Comment",
      dscr = "Add TEST Comment"
    }, { text { "<!-- TEST: " }, insert(1, ""), text(" -->") })
  },
  go = {
    snip("test", {
      text "func ", insert(1, "Name"), text "(t *testing.T)", text { " {", "" },
      text "\t", insert(0), text { "", "}" }
    }),
    snip("typei", {
      text "type ", insert(1, "Name"), text { " interface {", "" }, text "\t",
      insert(0), text { "", "}" }
    }),
    snip("types", {
      text "type ", insert(1, "Name"), text { " struct {", "" }, text "\t",
      insert(0), text { "", "}" }
    }),
    snip("func", {
      text "func ", insert(1, "Name"), text "(", insert(2), text ")", insert(3),
      text { " {", "" }, text "\t", insert(0), text { "", "}" }
    }),
    snip("if", {
      text "if ", insert(1, "true"), text { " {", "" }, text "\t", insert(0),
      text { "", "}" }
    }),
    snip("fori", {
      text "for ", insert(1, "i := 0"), text ";", insert(2, "i < 10"), text ";",
      insert(3, "i++"), text { " {", "" }, text "\t", insert(0), text { "", "}" }
    }),
    snip("forr", {
      text "for ", insert(1, "k, v"), text " := range ", insert(2, "expr"),
      text { " {", "" }, text "\t", insert(0), text { "", "}" }
    })
  }
})
