-- =============================================
-- ASUOM PAYMENTS IMPORT
-- Generated: 2025-12-26 11:24:18.628159
-- =============================================

DO $$
DECLARE
  v_branch_id UUID;
  v_case_id UUID;
BEGIN
  SELECT id INTO v_branch_id FROM branches WHERE name = 'Asuom Branch' LIMIT 1;
  IF v_branch_id IS NULL THEN RAISE EXCEPTION 'Branch not found'; END IF;

  -- Kwame Agbanyi (001)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '001' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-07-30', 'CASH', 'REGISTRATION', '1.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-07-30', 'CASH', 'EMBALMING', '1.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 728.0, '2024-08-29', 'CASH', 'COLDROOM', '1.0', NOW());
  END IF;
  -- Kwabena Nyame (002)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '002' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-08-01', 'CASH', 'REGISTRATION', '2.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-08-01', 'CASH', 'EMBALMING', '2.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 793.0, '2024-08-30', 'CASH', 'COLDROOM', '2.0', NOW());
  END IF;
  -- Joseph Awuah Gyimah (003)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '003' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-08-04', 'CASH', 'REGISTRATION', '12.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-08-04', 'CASH', 'EMBALMING', '3.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2340.0, '2024-11-01', 'CASH', 'COLDROOM', '12.0', NOW());
  END IF;
  -- Akos Aboagyewaa (004)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '004' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-08-09', 'CASH', 'REGISTRATION', '5.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-08-09', 'CASH', 'EMBALMING', '4.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1118.0, '2024-09-20', 'CASH', 'COLDROOM', '5.0', NOW());
  END IF;
  -- Kwame (005)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '005' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-08-15', 'CASH', 'REGISTRATION', '4.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-08-15', 'CASH', 'EMBALMING', '5.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 598.0, '2024-09-06', 'CASH', 'COLDROOM', '4.0', NOW());
  END IF;
  -- Emmanuel Osei (006)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '006' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-08-16', 'CASH', 'REGISTRATION', '14.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-08-16', 'CASH', 'EMBALMING', '6.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1417.0, '2024-09-08', 'CASH', 'COLDROOM', '14.0', NOW());
  END IF;
  -- Kwabena Asiamah (007)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '007' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-08-16', 'CASH', 'REGISTRATION', '24.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-08-16', 'CASH', 'EMBALMING', '7.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2756.0, '2024-11-29', 'CASH', 'COLDROOM', '24.0', NOW());
  END IF;
  -- Dorothy Koranteng (008)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '008' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-08-18', 'CASH', 'REGISTRATION', '3.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-08-18', 'CASH', 'EMBALMING', '8.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 364.0, '2024-08-31', 'CASH', 'COLDROOM', '3.0', NOW());
  END IF;
  -- Nicholas Appiah (009)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '009' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-08-20', 'CASH', 'REGISTRATION', '39.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-08-20', 'CASH', 'EMBALMING', '9.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 5200.0, '2025-03-07', 'CASH', 'COLDROOM', '39.0', NOW());
  END IF;
  -- Frimpong Manso (010)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '010' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-08-25', 'CASH', 'REGISTRATION', '19.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-08-25', 'CASH', 'EMBALMING', '10.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2522.0, '2024-11-29', 'CASH', 'COLDROOM', '19.0', NOW());
  END IF;
  -- Ama Asiedua (011)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '011' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-08-28', 'CASH', 'REGISTRATION', '59.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-08-28', 'CASH', 'EMBALMING', '11.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 5538.0, '2025-03-28', 'CASH', 'COLDROOM', '59.0', NOW());
  END IF;
  -- Elizabeth Anane (012)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '012' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-08-28', 'CASH', 'REGISTRATION', '86.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-08-28', 'CASH', 'EMBALMING', '12.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 6266.0, '2025-04-25', 'CASH', 'COLDROOM', '86.0', NOW());
  END IF;
  -- Alex Yeboah (013)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '013' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-08-30', 'CASH', 'REGISTRATION', '13.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-08-30', 'CASH', 'EMBALMING', '13.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1664.0, '2024-11-01', 'CASH', 'COLDROOM', '13.0', NOW());
  END IF;
  -- Teye Louis (014)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '014' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-01', 'CASH', 'REGISTRATION', '18.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-01', 'CASH', 'EMBALMING', '14.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2340.0, '2024-11-29', 'CASH', 'COLDROOM', '18.0', NOW());
  END IF;
  -- Kwaku Aboagye (015)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '015' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-03', 'CASH', 'REGISTRATION', '61.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-03', 'CASH', 'EMBALMING', '15.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 5382.0, '2025-03-28', 'CASH', 'COLDROOM', '61.0', NOW());
  END IF;
  -- Evans Kyei (016)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '016' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-04', 'CASH', 'REGISTRATION', '17.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-04', 'CASH', 'EMBALMING', '16.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2262.0, '2024-11-29', 'CASH', 'COLDROOM', '17.0', NOW());
  END IF;
  -- Eric Obeng (017)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '017' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-02', 'CASH', 'REGISTRATION', '9.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-02', 'CASH', 'EMBALMING', '17.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1586.0, '2024-11-01', 'CASH', 'COLDROOM', '9.0', NOW());
  END IF;
  -- Kojo Sarfo (018)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '018' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-08', 'CASH', 'REGISTRATION', '7.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-08', 'CASH', 'EMBALMING', '18.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1430.0, '2024-11-01', 'CASH', 'COLDROOM', '7.0', NOW());
  END IF;
  -- Mary Tikromah (019)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '019' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-08', 'CASH', 'REGISTRATION', '87.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-08', 'CASH', 'EMBALMING', '19.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 5980.0, '2025-04-25', 'CASH', 'COLDROOM', '87.0', NOW());
  END IF;
  -- Kwasi Fenting (020)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '020' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-10', 'CASH', 'REGISTRATION', '155.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-10', 'CASH', 'EMBALMING', '20.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 6435.0, '2025-05-30', 'CASH', 'COLDROOM', '155.0', NOW());
  END IF;
  -- Vida Adomaa Yaa (021)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '021' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-09', 'CASH', 'REGISTRATION', '6.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-09', 'CASH', 'EMBALMING', '21.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 494.0, '2024-09-27', 'CASH', 'COLDROOM', '6.0', NOW());
  END IF;
  -- Ohene Asiedu (022)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '022' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-11', 'CASH', 'REGISTRATION', '10.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-11', 'CASH', 'EMBALMING', '22.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1352.0, '2024-11-01', 'CASH', 'COLDROOM', '10.0', NOW());
  END IF;
  -- Samuel Dankyei (023)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '023' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-11', 'CASH', 'REGISTRATION', '21.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-11', 'CASH', 'EMBALMING', '23.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2080.0, '2024-11-29', 'CASH', 'COLDROOM', '21.0', NOW());
  END IF;
  -- Margaret Abena (024)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '024' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-17', 'CASH', 'REGISTRATION', '8.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-17', 'CASH', 'EMBALMING', '24.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 650.0, '2024-10-11', 'CASH', 'COLDROOM', '8.0', NOW());
  END IF;
  -- Kwasi Anane (025)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '025' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-17', 'CASH', 'REGISTRATION', '20.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-17', 'CASH', 'EMBALMING', '25.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1924.0, '2024-11-29', 'CASH', 'COLDROOM', '20.0', NOW());
  END IF;
  -- Samuel Antwi (026)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '026' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-25', 'CASH', 'REGISTRATION', '23.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-25', 'CASH', 'EMBALMING', '26.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1716.0, '2024-11-29', 'CASH', 'COLDROOM', '23.0', NOW());
  END IF;
  -- Grace Dzaka (027)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '027' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-25', 'CASH', 'REGISTRATION', '25.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-25', 'CASH', 'EMBALMING', '27.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1716.0, '2024-11-29', 'CASH', 'COLDROOM', '25.0', NOW());
  END IF;
  -- Kwaku Twum (028)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '028' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-09-30', 'CASH', 'REGISTRATION', '22.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-09-30', 'CASH', 'EMBALMING', '28.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1586.0, '2024-11-29', 'CASH', 'COLDROOM', '22.0', NOW());
  END IF;
  -- Raphael Tettey (029)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '029' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-01', 'CASH', 'REGISTRATION', '16.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-01', 'CASH', 'EMBALMING', '29.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1749.0, '2024-11-22', 'CASH', 'COLDROOM', '16.0', NOW());
  END IF;
  -- Akosua Manu (030)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '030' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-02', 'CASH', 'REGISTRATION', '38.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-02', 'CASH', 'EMBALMING', '30.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4173.0, '2025-03-07', 'CASH', 'COLDROOM', '38.0', NOW());
  END IF;
  -- Kwame Appiah (031)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '031' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-06', 'CASH', 'REGISTRATION', '15.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-06', 'CASH', 'EMBALMING', '31.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1066.0, '2024-11-15', 'CASH', 'COLDROOM', '15.0', NOW());
  END IF;
  -- Mercy Gyaubea (032)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '032' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-07', 'CASH', 'REGISTRATION', '65.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-07', 'CASH', 'EMBALMING', '32.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4498.0, '2025-03-28', 'CASH', 'COLDROOM', '65.0', NOW());
  END IF;
  -- Janet Amissah (033)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '033' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-10', 'CASH', 'REGISTRATION', '84.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-10', 'CASH', 'EMBALMING', '33.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 7920.0, '2025-04-25', 'CASH', 'COLDROOM', '84.0', NOW());
  END IF;
  -- Charlotte Addo (034)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '034' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-11', 'CASH', 'REGISTRATION', '54.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-11', 'CASH', 'EMBALMING', '34.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 6720.0, '2025-03-27', 'CASH', 'COLDROOM', '54.0', NOW());
  END IF;
  -- Affum Joseph (035)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '035' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-12', 'CASH', 'REGISTRATION', '11.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-12', 'CASH', 'EMBALMING', '35.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 546.0, '2024-11-01', 'CASH', 'COLDROOM', '11.0', NOW());
  END IF;
  -- Kwaku Osei (036)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '036' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-11', 'CASH', 'REGISTRATION', '33.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-11', 'CASH', 'EMBALMING', '36.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3484.0, '2025-02-21', 'CASH', 'COLDROOM', '33.0', NOW());
  END IF;
  -- Ofori Richard (037)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '037' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-13', 'CASH', 'REGISTRATION', '43.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-13', 'CASH', 'EMBALMING', '37.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4342.0, '2025-03-28', 'CASH', 'COLDROOM', '43.0', NOW());
  END IF;
  -- James Tetteh (038)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '038' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-18', 'CASH', 'REGISTRATION', '42.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-18', 'CASH', 'EMBALMING', '38.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 5920.0, '2025-03-14', 'CASH', 'COLDROOM', '42.0', NOW());
  END IF;
  -- Akosua Oforiwaa (039)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '039' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-18', 'CASH', 'REGISTRATION', '62.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-18', 'CASH', 'EMBALMING', '39.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4212.0, '2025-03-28', 'CASH', 'COLDROOM', '62.0', NOW());
  END IF;
  -- Ransford Asiedu (040)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '040' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-21', 'CASH', 'REGISTRATION', '96.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-21', 'CASH', 'EMBALMING', '40.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 5772.0, '2025-05-30', 'CASH', 'COLDROOM', '96.0', NOW());
  END IF;
  -- Kofi Okyere (041)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '041' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-22', 'CASH', 'REGISTRATION', '55.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-22', 'CASH', 'EMBALMING', '41.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4108.0, '2025-03-28', 'CASH', 'COLDROOM', '55.0', NOW());
  END IF;
  -- Samuel Mintah (042)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '042' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-22', 'CASH', 'REGISTRATION', '31.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-22', 'CASH', 'EMBALMING', '42.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3198.0, '2025-02-21', 'CASH', 'COLDROOM', '31.0', NOW());
  END IF;
  -- Akwasi Tawiah (043)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '043' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-23', 'CASH', 'REGISTRATION', '90.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-23', 'CASH', 'EMBALMING', '43.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 5720.0, '2025-05-30', 'CASH', 'COLDROOM', '90.0', NOW());
  END IF;
  -- Nti Aninkorah (044)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '044' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-10-29', 'CASH', 'REGISTRATION', '81.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-10-29', 'CASH', 'EMBALMING', '44.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4654.0, '2025-04-25', 'CASH', 'COLDROOM', '81.0', NOW());
  END IF;
  -- Kwao Juliana (045)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '045' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-11-01', 'CASH', 'REGISTRATION', '97.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-11-01', 'CASH', 'EMBALMING', '45.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 6520.0, '2025-05-02', 'CASH', 'COLDROOM', '97.0', NOW());
  END IF;
  -- S. A. Adu (046)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '046' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-11-06', 'CASH', 'REGISTRATION', '78.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-11-06', 'CASH', 'EMBALMING', '46.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 6840.0, '2025-04-25', 'CASH', 'COLDROOM', '78.0', NOW());
  END IF;
  -- Rose Ayimaah (047)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '047' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-11-08', 'CASH', 'REGISTRATION', '27.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-11-08', 'CASH', 'EMBALMING', '47.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2210.0, '2025-01-31', 'CASH', 'COLDROOM', '27.0', NOW());
  END IF;
  -- Comfort M. Treku (048)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '048' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-11-08', 'CASH', 'REGISTRATION', '30.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-11-08', 'CASH', 'EMBALMING', '48.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3029.0, '2025-03-07', 'CASH', 'COLDROOM', '30.0', NOW());
  END IF;
  -- Hayford Nyarko (049)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '049' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-11-16', 'CASH', 'REGISTRATION', '64.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-11-16', 'CASH', 'EMBALMING', '49.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3458.0, '2025-03-28', 'CASH', 'COLDROOM', '64.0', NOW());
  END IF;
  -- Yaw Asiedu (050)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '050' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-11-16', 'CASH', 'REGISTRATION', '28.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-11-16', 'CASH', 'EMBALMING', '50.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3080.0, '2025-01-31', 'CASH', 'COLDROOM', '28.0', NOW());
  END IF;
  -- Gifty Apochie (051)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '051' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-11-18', 'CASH', 'REGISTRATION', '34.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-11-18', 'CASH', 'EMBALMING', '51.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3168.0, '2025-02-21', 'CASH', 'COLDROOM', '34.0', NOW());
  END IF;
  -- Mercy Nyarkowaa (052)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '052' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-11-22', 'CASH', 'REGISTRATION', '91.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-11-22', 'CASH', 'EMBALMING', '52.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 7600.0, '2025-05-30', 'CASH', 'COLDROOM', '91.0', NOW());
  END IF;
  -- Janet Awal (053)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '053' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-11-25', 'CASH', 'REGISTRATION', '36.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-11-25', 'CASH', 'EMBALMING', '53.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2314.0, '2025-02-21', 'CASH', 'COLDROOM', '36.0', NOW());
  END IF;
  -- Kojo Brako (054)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '054' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-11-23', 'CASH', 'REGISTRATION', '68.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-11-23', 'CASH', 'EMBALMING', '54.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 5040.0, '2025-03-28', 'CASH', 'COLDROOM', '68.0', NOW());
  END IF;
  -- Grace Ankamaah (055)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '055' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-11-28', 'CASH', 'REGISTRATION', '48.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-11-28', 'CASH', 'EMBALMING', '55.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3146.0, '2025-03-28', 'CASH', 'COLDROOM', '48.0', NOW());
  END IF;
  -- Afia Takyiwaa (056)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '056' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-11-29', 'CASH', 'REGISTRATION', '40.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-11-29', 'CASH', 'EMBALMING', '56.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3960.0, '2025-03-07', 'CASH', 'COLDROOM', '40.0', NOW());
  END IF;
  -- Desmond D. George (057)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '057' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-12-01', 'CASH', 'REGISTRATION', '37.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-12-01', 'CASH', 'EMBALMING', '57.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2522.0, '2025-03-07', 'CASH', 'COLDROOM', '37.0', NOW());
  END IF;
  -- Paul Agyenim B. (058)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '058' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-12-02', 'CASH', 'REGISTRATION', '69.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-12-02', 'CASH', 'EMBALMING', '58.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3042.0, '2025-03-28', 'CASH', 'COLDROOM', '69.0', NOW());
  END IF;
  -- Yaw A. (059)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '059' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-11-30', 'CASH', 'REGISTRATION', '26.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-11-30', 'CASH', 'EMBALMING', '59.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 416.0, '2024-12-15', 'CASH', 'COLDROOM', '26.0', NOW());
  END IF;
  -- Kwaku Samuel (060)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '060' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-12-13', 'CASH', 'REGISTRATION', '51.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-12-13', 'CASH', 'EMBALMING', '60.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3960.0, '2025-03-21', 'CASH', 'COLDROOM', '51.0', NOW());
  END IF;
  -- Teye Amayo (061)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '061' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-12-15', 'CASH', 'REGISTRATION', '49.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-12-15', 'CASH', 'EMBALMING', '61.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2522.0, '2025-03-21', 'CASH', 'COLDROOM', '49.0', NOW());
  END IF;
  -- Patrick Ankomani (062)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '062' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-12-17', 'CASH', 'REGISTRATION', '60.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-12-17', 'CASH', 'EMBALMING', '62.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2652.0, '2025-03-28', 'CASH', 'COLDROOM', '60.0', NOW());
  END IF;
  -- Augustina Anima (063)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '063' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-12-18', 'CASH', 'REGISTRATION', '77.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-12-18', 'CASH', 'EMBALMING', '63.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3354.0, '2025-04-25', 'CASH', 'COLDROOM', '77.0', NOW());
  END IF;
  -- Asimeng (064)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '064' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-12-23', 'CASH', 'REGISTRATION', '41.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-12-23', 'CASH', 'EMBALMING', '64.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2496.0, '2025-03-28', 'CASH', 'COLDROOM', '41.0', NOW());
  END IF;
  -- Vida Kwakyewaa (065)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '065' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-12-23', 'CASH', 'REGISTRATION', '66.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-12-23', 'CASH', 'EMBALMING', '65.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2496.0, '2025-03-28', 'CASH', 'COLDROOM', '66.0', NOW());
  END IF;
  -- Mary Antwiwaa (066)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '066' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-12-25', 'CASH', 'REGISTRATION', '171.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-12-25', 'CASH', 'EMBALMING', '66.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 5174.0, '2025-07-11', 'CASH', 'COLDROOM', '171.0', NOW());
  END IF;
  -- Vida Serwaa (067)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '067' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-12-27', 'CASH', 'REGISTRATION', '56.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-12-27', 'CASH', 'EMBALMING', '67.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2392.0, '2025-03-28', 'CASH', 'COLDROOM', '56.0', NOW());
  END IF;
  -- Christina Darkwaa (068)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '068' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-12-27', 'CASH', 'REGISTRATION', '157.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-12-27', 'CASH', 'EMBALMING', '68.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4576.0, '2025-06-20', 'CASH', 'COLDROOM', '157.0', NOW());
  END IF;
  -- Comfort  Amponsah (069)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '069' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-12-30', 'CASH', 'REGISTRATION', '99.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-12-30', 'CASH', 'EMBALMING', '69.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3952.0, '2025-05-30', 'CASH', 'COLDROOM', '99.0', NOW());
  END IF;
  -- Korkor Ernestina (070)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '070' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2024-12-31', 'CASH', 'REGISTRATION', '85.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2024-12-31', 'CASH', 'EMBALMING', '70.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4640.0, '2025-04-25', 'CASH', 'COLDROOM', '85.0', NOW());
  END IF;
  -- Martha (071)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '071' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-01-01', 'CASH', 'REGISTRATION', '75.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-01-01', 'CASH', 'EMBALMING', '71.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2990.0, '2025-04-25', 'CASH', 'COLDROOM', '75.0', NOW());
  END IF;
  -- Atta Akwasi (072)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '072' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-01-07', 'CASH', 'REGISTRATION', '83.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-01-07', 'CASH', 'EMBALMING', '72.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4320.0, '2025-04-24', 'CASH', 'COLDROOM', '83.0', NOW());
  END IF;
  -- Kofi Mensah (073)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '073' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-01-09', 'CASH', 'REGISTRATION', '67.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-01-09', 'CASH', 'EMBALMING', '73.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2054.0, '2025-03-28', 'CASH', 'COLDROOM', '67.0', NOW());
  END IF;
  -- Kwabena Ayivi (074)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '074' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-01-16', 'CASH', 'REGISTRATION', '46.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-01-16', 'CASH', 'EMBALMING', '74.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1859.0, '2025-03-28', 'CASH', 'COLDROOM', '46.0', NOW());
  END IF;
  -- Michael Nimo (075)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '075' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-01-15', 'CASH', 'REGISTRATION', '45.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-01-15', 'CASH', 'EMBALMING', '75.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1534.0, '2025-03-14', 'CASH', 'COLDROOM', '45.0', NOW());
  END IF;
  -- Adwoa Beatrice (076)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '076' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-01-19', 'CASH', 'REGISTRATION', '98.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-01-19', 'CASH', 'EMBALMING', '76.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3432.0, '2025-05-30', 'CASH', 'COLDROOM', '98.0', NOW());
  END IF;
  -- Akua (077)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '077' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-01-18', 'CASH', 'REGISTRATION', '79.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-01-18', 'CASH', 'EMBALMING', '77.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2548.0, '2025-04-25', 'CASH', 'COLDROOM', '79.0', NOW());
  END IF;
  -- Ama Nkansah (078)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '078' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-01-22', 'CASH', 'REGISTRATION', '58.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-01-22', 'CASH', 'EMBALMING', '78.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1716.0, '2025-03-28', 'CASH', 'COLDROOM', '58.0', NOW());
  END IF;
  -- Kwaku Adu (079)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '079' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-01-26', 'CASH', 'REGISTRATION', '32.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-01-26', 'CASH', 'EMBALMING', '79.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 702.0, '2025-02-21', 'CASH', 'COLDROOM', '32.0', NOW());
  END IF;
  -- Ebenezer Kojo (080)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '080' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-01-27', 'CASH', 'REGISTRATION', '104.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-01-27', 'CASH', 'EMBALMING', '80.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 7956.0, '2025-11-28', 'CASH', 'COLDROOM', '104.0', NOW());
  END IF;
  -- Hannah Asabea (081)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '081' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-01-27', 'CASH', 'REGISTRATION', '169.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-01-27', 'CASH', 'EMBALMING', '81.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4316.0, '2025-07-11', 'CASH', 'COLDROOM', '169.0', NOW());
  END IF;
  -- Samson Kofi Mintah (082)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '082' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-01-31', 'CASH', 'REGISTRATION', '156.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-01-31', 'CASH', 'EMBALMING', '82.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3302.0, '2025-06-06', 'CASH', 'COLDROOM', '156.0', NOW());
  END IF;
  -- Akua (083)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '083' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-01-30', 'CASH', 'REGISTRATION', '63.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-01-30', 'CASH', 'EMBALMING', '83.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1508.0, '2025-03-28', 'CASH', 'COLDROOM', '63.0', NOW());
  END IF;
  -- George Frimpong (084)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '084' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-02', 'CASH', 'REGISTRATION', '35.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-02', 'CASH', 'EMBALMING', '84.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 520.0, '2025-02-21', 'CASH', 'COLDROOM', '35.0', NOW());
  END IF;
  -- Akosua Yeboah (085)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '085' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-04', 'CASH', 'REGISTRATION', '47.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-04', 'CASH', 'EMBALMING', '85.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4600.0, '2025-05-29', 'CASH', 'COLDROOM', '47.0', NOW());
  END IF;
  -- Yvette Asor (086)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '086' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-04', 'CASH', 'REGISTRATION', '89.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-04', 'CASH', 'EMBALMING', '86.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3939.0, '2025-07-11', 'CASH', 'COLDROOM', '89.0', NOW());
  END IF;
  -- William Mensah (087)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '087' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-04', 'CASH', 'REGISTRATION', '172.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-04', 'CASH', 'EMBALMING', '87.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4290.0, '2025-07-18', 'CASH', 'COLDROOM', '172.0', NOW());
  END IF;
  -- Charles Odurakwa (088)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '088' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-04', 'CASH', 'REGISTRATION', '53.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-04', 'CASH', 'EMBALMING', '88.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1378.0, '2025-03-28', 'CASH', 'COLDROOM', '53.0', NOW());
  END IF;
  -- Alex Prah (089)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '089' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-06', 'CASH', 'REGISTRATION', '29.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-06', 'CASH', 'EMBALMING', '89.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 182.0, '2025-02-12', 'CASH', 'COLDROOM', '29.0', NOW());
  END IF;
  -- Margaret Ofosua (090)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '090' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-09', 'CASH', 'REGISTRATION', '57.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-09', 'CASH', 'EMBALMING', '90.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1248.0, '2025-03-28', 'CASH', 'COLDROOM', '57.0', NOW());
  END IF;
  -- Faustina Sarfoaa (091)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '091' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-07', 'CASH', 'REGISTRATION', '186.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-07', 'CASH', 'EMBALMING', '91.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 5304.0, '2025-08-29', 'CASH', 'COLDROOM', '186.0', NOW());
  END IF;
  -- Stephen Kofi Boateng (092)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '092' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-11', 'CASH', 'REGISTRATION', '179.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-11', 'CASH', 'EMBALMING', '92.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 6880.0, '2025-08-01', 'CASH', 'COLDROOM', '179.0', NOW());
  END IF;
  -- Anane Kwame (093)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '093' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-17', 'CASH', 'REGISTRATION', '82.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-17', 'CASH', 'EMBALMING', '93.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1768.0, '2025-04-25', 'CASH', 'COLDROOM', '82.0', NOW());
  END IF;
  -- Beatrice Agyeiwaa (094)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '094' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-18', 'CASH', 'REGISTRATION', '153.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-18', 'CASH', 'EMBALMING', '94.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2652.0, '2025-05-30', 'CASH', 'COLDROOM', '153.0', NOW());
  END IF;
  -- Kwabena Ntiamoah (095)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '095' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-15', 'CASH', 'REGISTRATION', '151.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-15', 'CASH', 'EMBALMING', '95.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2730.0, '2025-05-30', 'CASH', 'COLDROOM', '151.0', NOW());
  END IF;
  -- Mama Gladys (096)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '096' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-20', 'CASH', 'REGISTRATION', '52.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-20', 'CASH', 'EMBALMING', '96.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 962.0, '2025-03-28', 'CASH', 'COLDROOM', '52.0', NOW());
  END IF;
  -- Regina Odurowaa (097)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '097' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-21', 'CASH', 'REGISTRATION', '92.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-21', 'CASH', 'EMBALMING', '97.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2522.0, '2025-05-28', 'CASH', 'COLDROOM', '92.0', NOW());
  END IF;
  -- Christina Antwi (098)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '098' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-24', 'CASH', 'REGISTRATION', '218.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-24', 'CASH', 'EMBALMING', '98.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 9720.0, '2025-10-24', 'CASH', 'COLDROOM', '218.0', NOW());
  END IF;
  -- Kwabena Asiamah (099)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '099' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-22', 'CASH', 'REGISTRATION', '70.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-22', 'CASH', 'EMBALMING', '99.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1092.0, '2025-04-04', 'CASH', 'COLDROOM', '70.0', NOW());
  END IF;
  -- Akosua Otiwaa (100)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '100' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-24', 'CASH', 'REGISTRATION', '80.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-24', 'CASH', 'EMBALMING', '100.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1586.0, '2025-04-25', 'CASH', 'COLDROOM', '80.0', NOW());
  END IF;
  -- Dora (101)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '101' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-25', 'CASH', 'REGISTRATION', '76.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-25', 'CASH', 'EMBALMING', '101.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1560.0, '2025-04-25', 'CASH', 'COLDROOM', '76.0', NOW());
  END IF;
  -- Antwi Darkwah (102)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '102' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-28', 'CASH', 'REGISTRATION', '246.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-28', 'CASH', 'EMBALMING', '102.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 10360.0, '2025-11-13', 'CASH', 'COLDROOM', '246.0', NOW());
  END IF;
  -- Ernestina Sarpeh (103)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '103' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-03-01', 'CASH', 'REGISTRATION', '94.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-03-01', 'CASH', 'EMBALMING', '103.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2366.0, '2025-05-30', 'CASH', 'COLDROOM', '94.0', NOW());
  END IF;
  -- Victor Gameh (104)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '104' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-02-27', 'CASH', 'REGISTRATION', '182.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-02-27', 'CASH', 'EMBALMING', '104.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4602.0, '2025-08-22', 'CASH', 'COLDROOM', '182.0', NOW());
  END IF;
  -- Yaa Love (105)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '105' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-03-05', 'CASH', 'REGISTRATION', '88.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-03-05', 'CASH', 'EMBALMING', '105.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1352.0, '2025-04-25', 'CASH', 'COLDROOM', '88.0', NOW());
  END IF;
  -- Yaw Twum (106)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '106' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-03-07', 'CASH', 'REGISTRATION', '168.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-03-07', 'CASH', 'EMBALMING', '106.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3302.0, '2025-07-11', 'CASH', 'COLDROOM', '168.0', NOW());
  END IF;
  -- Akyea Frimpong (107)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '107' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-03-08', 'CASH', 'REGISTRATION', '162.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-03-08', 'CASH', 'EMBALMING', '107.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4200.0, '2025-06-20', 'CASH', 'COLDROOM', '162.0', NOW());
  END IF;
  -- Asare Antwi (108)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '108' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-03-10', 'CASH', 'REGISTRATION', '95.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-03-10', 'CASH', 'EMBALMING', '109.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2132.0, '2025-05-30', 'CASH', 'COLDROOM', '95.0', NOW());
  END IF;
  -- Ophelia Ama Dede (109)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '109' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-03-11', 'CASH', 'REGISTRATION', '187.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-03-11', 'CASH', 'EMBALMING', '111.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 6880.0, '2025-08-29', 'CASH', 'COLDROOM', '187.0', NOW());
  END IF;
  -- Darko Dickson (110)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '110' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-03-13', 'CASH', 'REGISTRATION', '170.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-03-13', 'CASH', 'EMBALMING', '113.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3146.0, '2025-07-11', 'CASH', 'COLDROOM', '170.0', NOW());
  END IF;
  -- Grace Afrah (111)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '111' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-03-17', 'CASH', 'REGISTRATION', '93.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-03-17', 'CASH', 'EMBALMING', '114.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2986.0, '2025-05-30', 'CASH', 'COLDROOM', '93.0', NOW());
  END IF;
  -- Simon Kofi Odonkor (112)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '112' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-03-27', 'CASH', 'REGISTRATION', '164.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-03-27', 'CASH', 'EMBALMING', '115.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2418.0, '2025-06-27', 'CASH', 'COLDROOM', '164.0', NOW());
  END IF;
  -- Afia Nana (113)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '113' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-03-30', 'CASH', 'REGISTRATION', '71.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-03-30', 'CASH', 'EMBALMING', '116.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 760.0, '2025-04-17', 'CASH', 'COLDROOM', '71.0', NOW());
  END IF;
  -- Selina Donkor Ofosua (114)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '114' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-03-29', 'CASH', 'REGISTRATION', '222.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-03-29', 'CASH', 'EMBALMING', '117.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 5642.0, '2025-10-31', 'CASH', 'COLDROOM', '222.0', NOW());
  END IF;
  -- Mary Nnisin (115)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '115' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-03-31', 'CASH', 'REGISTRATION', '190.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-03-31', 'CASH', 'EMBALMING', '118.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3752.0, '2025-08-29', 'CASH', 'COLDROOM', '190.0', NOW());
  END IF;
  -- Alice Abena Korkor (116)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '116' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-06', 'CASH', 'REGISTRATION', '152.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-06', 'CASH', 'EMBALMING', '119.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1430.0, '2025-05-30', 'CASH', 'COLDROOM', '152.0', NOW());
  END IF;
  -- Grace Ampofowaa (117)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '117' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-08', 'CASH', 'REGISTRATION', '176.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-08', 'CASH', 'EMBALMING', '120.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4640.0, '2025-08-01', 'CASH', 'COLDROOM', '176.0', NOW());
  END IF;
  -- Janet Adwapa (118)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '118' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-10', 'CASH', 'REGISTRATION', '191.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-10', 'CASH', 'EMBALMING', '121.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 5380.0, '2025-08-29', 'CASH', 'COLDROOM', '191.0', NOW());
  END IF;
  -- Jennifer Kyeraa (119)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '119' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-10', 'CASH', 'REGISTRATION', '161.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-10', 'CASH', 'EMBALMING', '122.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3160.0, '2025-06-27', 'CASH', 'COLDROOM', '161.0', NOW());
  END IF;
  -- Abena Bedge (120)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '120' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-11', 'CASH', 'REGISTRATION', '158.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-11', 'CASH', 'EMBALMING', '123.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1846.0, '2025-06-20', 'CASH', 'COLDROOM', '158.0', NOW());
  END IF;
  -- Isaac Kwasi Appiah (121)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '121' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-14', 'CASH', 'REGISTRATION', '72.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-14', 'CASH', 'EMBALMING', '124.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 52.0, '2025-04-15', 'CASH', 'COLDROOM', '72.0', NOW());
  END IF;
  -- Alfred Kwaku Gyensah (122)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '122' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-11', 'CASH', 'REGISTRATION', '249.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-11', 'CASH', 'EMBALMING', '125.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 6032.0, '2025-11-28', 'CASH', 'COLDROOM', '249.0', NOW());
  END IF;
  -- Kwasi George (123)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '123' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-13', 'CASH', 'REGISTRATION', '183.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-13', 'CASH', 'EMBALMING', '126.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3614.0, '2025-08-29', 'CASH', 'COLDROOM', '183.0', NOW());
  END IF;
  -- Mercy Acheampomaa (124)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '124' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-14', 'CASH', 'REGISTRATION', '105.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-14', 'CASH', 'EMBALMING', '127.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 8960.0, '2025-11-28', 'CASH', 'COLDROOM', '105.0', NOW());
  END IF;
  -- Mabel Afrah (125)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '125' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-14', 'CASH', 'REGISTRATION', '175.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-14', 'CASH', 'EMBALMING', '128.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4400.0, '2025-08-01', 'CASH', 'COLDROOM', '175.0', NOW());
  END IF;
  -- Erica Boakye (126)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '126' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-15', 'CASH', 'REGISTRATION', '73.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-15', 'CASH', 'EMBALMING', '129.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 260.0, '2025-04-24', 'CASH', 'COLDROOM', '73.0', NOW());
  END IF;
  -- Mercy Yeboah (127)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '127' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-16', 'CASH', 'REGISTRATION', '229.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-16', 'CASH', 'EMBALMING', '130.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 7880.0, '2025-10-29', 'CASH', 'COLDROOM', '229.0', NOW());
  END IF;
  -- Joseph Bortey Alabi (128)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '128' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-16', 'CASH', 'REGISTRATION', '154.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-16', 'CASH', 'EMBALMING', '131.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1170.0, '2025-05-30', 'CASH', 'COLDROOM', '154.0', NOW());
  END IF;
  -- Comfort Awo (129)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '129' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-16', 'CASH', 'REGISTRATION', '248.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-16', 'CASH', 'EMBALMING', '132.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 5620.0, '2025-11-21', 'CASH', 'COLDROOM', '248.0', NOW());
  END IF;
  -- Kwame Attah (130)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '130' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-18', 'CASH', 'REGISTRATION', '178.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-18', 'CASH', 'EMBALMING', '133.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2756.0, '2025-08-01', 'CASH', 'COLDROOM', '178.0', NOW());
  END IF;
  -- Yaw Nyarko (131)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '131' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-19', 'CASH', 'REGISTRATION', '198.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-19', 'CASH', 'EMBALMING', '134.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 5600.0, '2025-09-05', 'CASH', 'COLDROOM', '198.0', NOW());
  END IF;
  -- Kwasi Yeboah (132)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '132' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-04-30', 'CASH', 'REGISTRATION', '242.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-04-30', 'CASH', 'EMBALMING', '135.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4810.0, '2025-10-31', 'CASH', 'COLDROOM', '242.0', NOW());
  END IF;
  -- Yaw Mark Adu (133)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '133' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-05-01', 'CASH', 'REGISTRATION', '165.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-05-01', 'CASH', 'EMBALMING', '136.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1872.0, '2025-07-11', 'CASH', 'COLDROOM', '165.0', NOW());
  END IF;
  -- Margaret Boatemaa (134)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '134' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-05-02', 'CASH', 'REGISTRATION', '203.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-05-02', 'CASH', 'EMBALMING', '137.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 6200.0, '2025-10-03', 'CASH', 'COLDROOM', '203.0', NOW());
  END IF;
  -- Emmanuel Amoako G. (135)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '135' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-05-04', 'CASH', 'REGISTRATION', '233.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-05-04', 'CASH', 'EMBALMING', '138.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 7240.0, '2025-10-31', 'CASH', 'COLDROOM', '233.0', NOW());
  END IF;
  -- Joyce Oforiwaa (136)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '136' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-05-09', 'CASH', 'REGISTRATION', '194.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-05-09', 'CASH', 'EMBALMING', '139.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4520.0, '2025-08-29', 'CASH', 'COLDROOM', '194.0', NOW());
  END IF;
  -- Florence Kumiwaa (137)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '137' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-05-11', 'CASH', 'REGISTRATION', '189.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-05-11', 'CASH', 'EMBALMING', '140.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2886.0, '2025-08-29', 'CASH', 'COLDROOM', '189.0', NOW());
  END IF;
  -- Noah Teye (138)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '138' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-05-15', 'CASH', 'REGISTRATION', '184.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-05-15', 'CASH', 'EMBALMING', '142.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2600.0, '2025-08-22', 'CASH', 'COLDROOM', '184.0', NOW());
  END IF;
  -- Kwame Agyei (139)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '139' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-05-20', 'CASH', 'REGISTRATION', '180.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-05-20', 'CASH', 'EMBALMING', '143.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1924.0, '2025-08-01', 'CASH', 'COLDROOM', '180.0', NOW());
  END IF;
  -- Afia Martha Frimpomaa (140)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '140' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-05-21', 'CASH', 'REGISTRATION', '234.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-05-21', 'CASH', 'EMBALMING', '144.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4264.0, '2025-10-31', 'CASH', 'COLDROOM', '234.0', NOW());
  END IF;
  -- Comfort Appeah (141)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '141' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-05-22', 'CASH', 'REGISTRATION', '231.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-05-22', 'CASH', 'EMBALMING', '145.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4121.0, '2025-10-31', 'CASH', 'COLDROOM', '231.0', NOW());
  END IF;
  -- Kwasi Asare (142)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '142' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-05-23', 'CASH', 'REGISTRATION', '167.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-05-23', 'CASH', 'EMBALMING', '146.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1300.0, '2025-07-11', 'CASH', 'COLDROOM', '167.0', NOW());
  END IF;
  -- Samuel Nyarko (143)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '143' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-05-25', 'CASH', 'REGISTRATION', '115.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-05-25', 'CASH', 'EMBALMING', '147.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 7320.0, '2025-11-28', 'CASH', 'COLDROOM', '115.0', NOW());
  END IF;
  -- Yaa Ntiamoah (144)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '144' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-05-28', 'CASH', 'REGISTRATION', '196.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-05-28', 'CASH', 'EMBALMING', '148.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3260.0, '2025-08-29', 'CASH', 'COLDROOM', '196.0', NOW());
  END IF;
  -- Ebenezer Ofosuhene Antwi (145)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '145' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-05-29', 'CASH', 'REGISTRATION', '185.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-05-29', 'CASH', 'EMBALMING', '149.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2236.0, '2025-08-22', 'CASH', 'COLDROOM', '185.0', NOW());
  END IF;
  -- Yaw Darko (146)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '146' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-01', 'CASH', 'REGISTRATION', '166.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-01', 'CASH', 'EMBALMING', '150.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1066.0, '2025-07-11', 'CASH', 'COLDROOM', '166.0', NOW());
  END IF;
  -- Comfort Abong (147)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '147' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-05-31', 'CASH', 'REGISTRATION', '240.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-05-31', 'CASH', 'EMBALMING', '151.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 6160.0, '2025-10-31', 'CASH', 'COLDROOM', '240.0', NOW());
  END IF;
  -- Thomas Peprah (148)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '148' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-03', 'CASH', 'REGISTRATION', '210.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-03', 'CASH', 'EMBALMING', '152.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3198.0, '2025-10-03', 'CASH', 'COLDROOM', '210.0', NOW());
  END IF;
  -- Mina Asantewaa (149)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '149' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-04', 'CASH', 'REGISTRATION', '208.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-04', 'CASH', 'EMBALMING', '153.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2786.0, '2025-10-03', 'CASH', 'COLDROOM', '208.0', NOW());
  END IF;
  -- Regina Konadu (150)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '150' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-03', 'CASH', 'EMBALMING', '154.0', NOW());
  END IF;
  -- Yawson Asante (151)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '151' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-03', 'CASH', 'REGISTRATION', '202.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-03', 'CASH', 'EMBALMING', '155.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4360.0, '2025-09-19', 'CASH', 'COLDROOM', '202.0', NOW());
  END IF;
  -- Felix Kwadwo Ampofo (152)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '152' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-05', 'CASH', 'REGISTRATION', '108.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-05', 'CASH', 'EMBALMING', '156.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 6880.0, '2025-11-28', 'CASH', 'COLDROOM', '108.0', NOW());
  END IF;
  -- Yaa Asuma (153)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '153' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-06', 'CASH', 'REGISTRATION', '207.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-06', 'CASH', 'EMBALMING', '157.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3120.0, '2025-10-03', 'CASH', 'COLDROOM', '207.0', NOW());
  END IF;
  -- Dickson Kwame (154)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '154' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-07', 'CASH', 'REGISTRATION', '226.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-07', 'CASH', 'EMBALMING', '158.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3770.0, '2025-10-29', 'CASH', 'COLDROOM', '226.0', NOW());
  END IF;
  -- Adwoa Darkwaa (155)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '155' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-09', 'CASH', 'REGISTRATION', '192.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-09', 'CASH', 'EMBALMING', '159.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2132.0, '2025-08-29', 'CASH', 'COLDROOM', '192.0', NOW());
  END IF;
  -- Nelson Kwasi Nartey (156)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '156' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-10', 'CASH', 'REGISTRATION', '225.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-10', 'CASH', 'EMBALMING', '160.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3562.0, '2025-10-24', 'CASH', 'COLDROOM', '225.0', NOW());
  END IF;
  -- Yaw Oppong (157)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '157' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-10', 'CASH', 'REGISTRATION', '197.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-10', 'CASH', 'EMBALMING', '161.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2106.0, '2025-08-29', 'CASH', 'COLDROOM', '197.0', NOW());
  END IF;
  -- Dora Afrah (158)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '158' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-12', 'CASH', 'REGISTRATION', '243.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-12', 'CASH', 'EMBALMING', '162.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3692.0, '2025-10-31', 'CASH', 'COLDROOM', '243.0', NOW());
  END IF;
  -- Alice Asaah (159)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '159' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-14', 'CASH', 'EMBALMING', '163.0', NOW());
  END IF;
  -- Patience Oforiwaa (160)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '160' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-16', 'CASH', 'REGISTRATION', '193.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-16', 'CASH', 'EMBALMING', '164.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3000.0, '2025-08-29', 'CASH', 'COLDROOM', '193.0', NOW());
  END IF;
  -- Man Togo (161)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '161' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-19', 'CASH', 'REGISTRATION', '173.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-19', 'CASH', 'EMBALMING', '165.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 988.0, '2025-07-26', 'CASH', 'COLDROOM', '173.0', NOW());
  END IF;
  -- Doris Ohenewaa (162)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '162' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-19', 'CASH', 'REGISTRATION', '205.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-19', 'CASH', 'EMBALMING', '166.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2782.0, '2025-10-03', 'CASH', 'COLDROOM', '205.0', NOW());
  END IF;
  -- Daniel Kwame Marfo (163)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '163' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-19', 'CASH', 'REGISTRATION', '160.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-19', 'CASH', 'EMBALMING', '167.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 156.0, '2025-06-24', 'CASH', 'COLDROOM', '160.0', NOW());
  END IF;
  -- Sophia Frimpong (164)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '164' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-19', 'CASH', 'REGISTRATION', '174.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-19', 'CASH', 'EMBALMING', '168.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 416.0, '2025-07-04', 'CASH', 'COLDROOM', '174.0', NOW());
  END IF;
  -- Afi Tagbor (165)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '165' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-22', 'CASH', 'REGISTRATION', '219.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-22', 'CASH', 'EMBALMING', '169.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3328.0, '2025-10-31', 'CASH', 'COLDROOM', '219.0', NOW());
  END IF;
  -- Rose Animah (166)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '166' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-24', 'CASH', 'REGISTRATION', '206.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-24', 'CASH', 'EMBALMING', '170.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4080.0, '2025-10-03', 'CASH', 'COLDROOM', '206.0', NOW());
  END IF;
  -- Sarah Attaa (167)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '167' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-25', 'CASH', 'REGISTRATION', '241.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-25', 'CASH', 'EMBALMING', '171.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3354.0, '2025-10-31', 'CASH', 'COLDROOM', '241.0', NOW());
  END IF;
  -- Samuel Akuako (168)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '168' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-25', 'CASH', 'REGISTRATION', '217.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-25', 'CASH', 'EMBALMING', '172.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3328.0, '2025-10-30', 'CASH', 'COLDROOM', '217.0', NOW());
  END IF;
  -- Daniel Opoku (169)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '169' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-29', 'CASH', 'REGISTRATION', '211.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-29', 'CASH', 'EMBALMING', '173.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2522.0, '2025-10-03', 'CASH', 'COLDROOM', '211.0', NOW());
  END IF;
  -- Comfort Afrah (170)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '170' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-28', 'CASH', 'REGISTRATION', '235.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-28', 'CASH', 'EMBALMING', '174.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3276.0, '2025-10-31', 'CASH', 'COLDROOM', '235.0', NOW());
  END IF;
  -- Esther Serwaa (171)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '171' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-06-30', 'CASH', 'REGISTRATION', '236.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-06-30', 'CASH', 'EMBALMING', '175.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4960.0, '2025-10-31', 'CASH', 'COLDROOM', '236.0', NOW());
  END IF;
  -- Patrick Tetteh (172)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '172' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-07-01', 'CASH', 'REGISTRATION', '195.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-07-01', 'CASH', 'EMBALMING', '176.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1560.0, '2025-08-29', 'CASH', 'COLDROOM', '195.0', NOW());
  END IF;
  -- Grace Asiedua (173)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '173' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-07-09', 'CASH', 'REGISTRATION', '247.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-07-09', 'CASH', 'EMBALMING', '177.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3618.0, '2025-11-28', 'CASH', 'COLDROOM', '247.0', NOW());
  END IF;
  -- Alex Antwi Darko (174)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '174' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-07-11', 'CASH', 'EMBALMING', '178.0', NOW());
  END IF;
  -- Akosua Beatrice (175)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '175' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-07-13', 'CASH', 'REGISTRATION', '212.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-07-13', 'CASH', 'EMBALMING', '179.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2158.0, '2025-10-03', 'CASH', 'COLDROOM', '212.0', NOW());
  END IF;
  -- Kwadwo Darkwah (176)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '176' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-07-17', 'CASH', 'REGISTRATION', '215.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-07-17', 'CASH', 'EMBALMING', '180.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2054.0, '2025-10-03', 'CASH', 'COLDROOM', '215.0', NOW());
  END IF;
  -- Deborah Otenewaa (177)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '177' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-07-19', 'CASH', 'REGISTRATION', '214.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-07-19', 'CASH', 'EMBALMING', '181.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3080.0, '2025-10-03', 'CASH', 'COLDROOM', '214.0', NOW());
  END IF;
  -- Godwin Adamtey (178)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '178' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-07-18', 'CASH', 'REGISTRATION', '200.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-07-18', 'CASH', 'EMBALMING', '182.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2560.0, '2025-09-19', 'CASH', 'COLDROOM', '200.0', NOW());
  END IF;
  -- Christopher Addo (179)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '179' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-07-20', 'CASH', 'REGISTRATION', '177.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-07-20', 'CASH', 'EMBALMING', '183.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 338.0, '2025-08-01', 'CASH', 'COLDROOM', '177.0', NOW());
  END IF;
  -- Rita Antwi (180)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '180' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-07-19', 'CASH', 'REGISTRATION', '230.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-07-19', 'CASH', 'EMBALMING', '184.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2730.0, '2025-10-31', 'CASH', 'COLDROOM', '230.0', NOW());
  END IF;
  -- Kofi Alhassan (181)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '181' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-07-22', 'CASH', 'REGISTRATION', '221.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-07-22', 'CASH', 'EMBALMING', '185.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3800.0, '2025-10-24', 'CASH', 'COLDROOM', '221.0', NOW());
  END IF;
  -- Francis Owusu (182)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '182' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-07-23', 'CASH', 'REGISTRATION', '188.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-07-23', 'CASH', 'EMBALMING', '186.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1520.0, '2025-08-29', 'CASH', 'COLDROOM', '188.0', NOW());
  END IF;
  -- Joseph Antiri Ofori-Atta (183)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '183' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-07-29', 'CASH', 'REGISTRATION', '228.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-07-29', 'CASH', 'EMBALMING', '187.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3520.0, '2025-10-24', 'CASH', 'COLDROOM', '228.0', NOW());
  END IF;
  -- Ama Adukpo (184)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '184' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-07-30', 'CASH', 'EMBALMING', '188.0', NOW());
  END IF;
  -- Emmanuel Essel (185)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '185' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-08-04', 'CASH', 'REGISTRATION', '199.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-04', 'CASH', 'EMBALMING', '189.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1040.0, '2025-09-12', 'CASH', 'COLDROOM', '199.0', NOW());
  END IF;
  -- Dickson Amedzo (186)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '186' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-08-05', 'CASH', 'REGISTRATION', '118.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-05', 'CASH', 'EMBALMING', '190.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4440.0, '2025-11-28', 'CASH', 'COLDROOM', '118.0', NOW());
  END IF;
  -- Alex Kofi Darkwah (187)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '187' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-08-06', 'CASH', 'REGISTRATION', '116.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-06', 'CASH', 'EMBALMING', '191.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2890.0, '2025-11-28', 'CASH', 'COLDROOM', '116.0', NOW());
  END IF;
  -- Alexander Brobbey (188)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '188' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-08-08', 'CASH', 'REGISTRATION', '216.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-08', 'CASH', 'EMBALMING', '192.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1482.0, '2025-10-03', 'CASH', 'COLDROOM', '216.0', NOW());
  END IF;
  -- Dora Darkwaah (189)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '189' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-08-09', 'CASH', 'REGISTRATION', '227.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-09', 'CASH', 'EMBALMING', '193.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2520.0, '2025-10-31', 'CASH', 'COLDROOM', '227.0', NOW());
  END IF;
  -- Kofi Ametekpe (190)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '190' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-08-13', 'CASH', 'REGISTRATION', '201.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-13', 'CASH', 'EMBALMING', '194.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 988.0, '2025-09-19', 'CASH', 'COLDROOM', '201.0', NOW());
  END IF;
  -- Margaret Nyankson (191)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '191' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-13', 'CASH', 'EMBALMING', '195.0', NOW());
  END IF;
  -- Kwasi Nimako (192)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '192' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-08-14', 'CASH', 'REGISTRATION', '101.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-14', 'CASH', 'EMBALMING', '196.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 4180.0, '2025-11-28', 'CASH', 'COLDROOM', '101.0', NOW());
  END IF;
  -- Matilda Obenewaa (193)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '193' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-15', 'CASH', 'EMBALMING', '197.0', NOW());
  END IF;
  -- Kwame Yeboah (194)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '194' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-08-18', 'CASH', 'REGISTRATION', '238.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-18', 'CASH', 'EMBALMING', '198.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3000.0, '2025-10-31', 'CASH', 'COLDROOM', '238.0', NOW());
  END IF;
  -- Isaac Kwabena Bosompem (195)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '195' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-08-23', 'CASH', 'REGISTRATION', '213.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-23', 'CASH', 'EMBALMING', '199.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1092.0, '2025-10-03', 'CASH', 'COLDROOM', '213.0', NOW());
  END IF;
  -- Beatrice Akosua Antwiwaa (196)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '196' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-08-24', 'CASH', 'REGISTRATION', '107.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-24', 'CASH', 'EMBALMING', '200.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2422.0, '2025-11-28', 'CASH', 'COLDROOM', '107.0', NOW());
  END IF;
  -- Kofi Darkwah (197)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '197' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-26', 'CASH', 'EMBALMING', '201.0', NOW());
  END IF;
  -- Adwoa Kwakyewaa (198)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '198' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-26', 'CASH', 'EMBALMING', '202.0', NOW());
  END IF;
  -- Attah Ahorku (199)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '199' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-08-28', 'CASH', 'REGISTRATION', '113.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-28', 'CASH', 'EMBALMING', '203.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2318.0, '2025-11-28', 'CASH', 'COLDROOM', '113.0', NOW());
  END IF;
  -- Comfort Inkum (200)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '200' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-08-30', 'CASH', 'EMBALMING', '205.0', NOW());
  END IF;
  -- Kennedy Ampaw (201)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '201' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-09-01', 'CASH', 'REGISTRATION', '103.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-01', 'CASH', 'EMBALMING', '206.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 3460.0, '2025-11-28', 'CASH', 'COLDROOM', '103.0', NOW());
  END IF;
  -- Emmanuel Tsati (202)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '202' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-09-02', 'CASH', 'REGISTRATION', '250.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-02', 'CASH', 'EMBALMING', '207.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2288.0, '2025-11-28', 'CASH', 'COLDROOM', '250.0', NOW());
  END IF;
  -- Alex Twumasi (203)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '203' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-09-03', 'CASH', 'REGISTRATION', '220.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-03', 'CASH', 'EMBALMING', '208.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1352.0, '2025-10-24', 'CASH', 'COLDROOM', '220.0', NOW());
  END IF;
  -- Amos Martey (204)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '204' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-04', 'CASH', 'EMBALMING', '209.0', NOW());
  END IF;
  -- Comfort Bruwaa (205)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '205' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-05', 'CASH', 'EMBALMING', '210.0', NOW());
  END IF;
  -- Kofi Oduro (206)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '206' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-09-08', 'CASH', 'REGISTRATION', '209.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-08', 'CASH', 'EMBALMING', '211.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 676.0, '2025-10-03', 'CASH', 'COLDROOM', '209.0', NOW());
  END IF;
  -- Dede Nartey (207)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '207' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-09-10', 'CASH', 'REGISTRATION', '106.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-10', 'CASH', 'EMBALMING', '212.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2080.0, '2025-11-28', 'CASH', 'COLDROOM', '106.0', NOW());
  END IF;
  -- Hayford Mensah (208)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '208' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-09-11', 'CASH', 'REGISTRATION', '239.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-11', 'CASH', 'EMBALMING', '213.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1326.0, '2025-10-31', 'CASH', 'COLDROOM', '239.0', NOW());
  END IF;
  -- William Addo (209)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '209' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-09-12', 'CASH', 'REGISTRATION', '117.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-12', 'CASH', 'EMBALMING', '214.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 2028.0, '2025-11-28', 'CASH', 'COLDROOM', '117.0', NOW());
  END IF;
  -- Ali Tetteh (210)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '210' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-09-14', 'CASH', 'REGISTRATION', '112.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-14', 'CASH', 'EMBALMING', '215.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1976.0, '2025-11-28', 'CASH', 'COLDROOM', '112.0', NOW());
  END IF;
  -- Adama Sagno (211)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '211' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-09-15', 'CASH', 'REGISTRATION', '204.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-15', 'CASH', 'EMBALMING', '216.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 240.0, '2025-09-20', 'CASH', 'COLDROOM', '204.0', NOW());
  END IF;
  -- Tetteh Wayoe (212)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '212' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-23', 'CASH', 'EMBALMING', '217.0', NOW());
  END IF;
  -- William Ofori (213)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '213' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-09-25', 'CASH', 'REGISTRATION', '244.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-25', 'CASH', 'EMBALMING', '218.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 962.0, '2025-10-31', 'CASH', 'COLDROOM', '244.0', NOW());
  END IF;
  -- Enock Brafo (214)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '214' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-09-25', 'CASH', 'REGISTRATION', '120.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-25', 'CASH', 'EMBALMING', '219.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1924.0, '2025-12-07', 'CASH', 'COLDROOM', '120.0', NOW());
  END IF;
  -- Yaw Peprah (215)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '215' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-09-27', 'CASH', 'EMBALMING', '220.0', NOW());
  END IF;
  -- Paul Brako (216)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '216' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-02', 'CASH', 'EMBALMING', '221.0', NOW());
  END IF;
  -- Comfort Apenteng (217)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '217' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-05', 'CASH', 'EMBALMING', '222.0', NOW());
  END IF;
  -- Georgina Korang (218)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '218' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-10-03', 'CASH', 'REGISTRATION', '232.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-03', 'CASH', 'EMBALMING', '223.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 754.0, '2025-10-31', 'CASH', 'COLDROOM', '232.0', NOW());
  END IF;
  -- Juliana Odurowaa (219)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '219' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-07', 'CASH', 'EMBALMING', '224.0', NOW());
  END IF;
  -- Adwoa Owusua (220)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '220' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-10', 'CASH', 'EMBALMING', '225.0', NOW());
  END IF;
  -- Philipa Aryeetey (221)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '221' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-12', 'CASH', 'EMBALMING', '226.0', NOW());
  END IF;
  -- Emmanuel Osei (222)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '222' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-15', 'CASH', 'EMBALMING', '227.0', NOW());
  END IF;
  -- Ama Cynthia (223)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '223' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-10-14', 'CASH', 'REGISTRATION', '101.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-14', 'CASH', 'EMBALMING', '228.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1196.0, '2025-11-28', 'CASH', 'COLDROOM', '101.0', NOW());
  END IF;
  -- Nicholas Kwadwo Yeboah (224)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '224' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-15', 'CASH', 'EMBALMING', '229.0', NOW());
  END IF;
  -- Samuel Kikisi (225)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '225' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-17', 'CASH', 'EMBALMING', '230.0', NOW());
  END IF;
  -- Godfred K. Ampabeng (226)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '226' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-10-18', 'CASH', 'REGISTRATION', '102.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-18', 'CASH', 'EMBALMING', '231.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 1092.0, '2025-11-28', 'CASH', 'COLDROOM', '102.0', NOW());
  END IF;
  -- Boadi Darkwah (227)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '227' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-17', 'CASH', 'EMBALMING', '232.0', NOW());
  END IF;
  -- Esther Boaduaa (228)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '228' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-20', 'CASH', 'EMBALMING', '233.0', NOW());
  END IF;
  -- Kwaku Peprah Mireku (229)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '229' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-20', 'CASH', 'EMBALMING', '234.0', NOW());
  END IF;
  -- Akua Botwe (230)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '230' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-10-18', 'CASH', 'REGISTRATION', '237.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-18', 'CASH', 'EMBALMING', '235.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 480.0, '2025-10-29', 'CASH', 'COLDROOM', '237.0', NOW());
  END IF;
  -- Kwabena Appiah (231)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '231' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-10-21', 'CASH', 'REGISTRATION', '223.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-21', 'CASH', 'EMBALMING', '236.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 104.0, '2025-10-24', 'CASH', 'COLDROOM', '223.0', NOW());
  END IF;
  -- Abdul Razak Sulemana (232)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '232' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-10-22', 'CASH', 'REGISTRATION', '224.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-22', 'CASH', 'EMBALMING', '237.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 60.0, '2025-10-23', 'CASH', 'COLDROOM', '224.0', NOW());
  END IF;
  -- Bernard Asamoah (233)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '233' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-10-23', 'CASH', 'REGISTRATION', '114.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-23', 'CASH', 'EMBALMING', '238.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 962.0, '2025-11-28', 'CASH', 'COLDROOM', '114.0', NOW());
  END IF;
  -- Ama Obenewaa (234)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '234' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-27', 'CASH', 'EMBALMING', '239.0', NOW());
  END IF;
  -- Janet Aboagyewaa (235)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '235' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-29', 'CASH', 'EMBALMING', '240.0', NOW());
  END IF;
  -- Ernestina Asieduaa (236)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '236' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-30', 'CASH', 'EMBALMING', '241.0', NOW());
  END IF;
  -- Goyen Appam (237)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '237' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-10-30', 'CASH', 'REGISTRATION', '109.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-10-30', 'CASH', 'EMBALMING', '242.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 780.0, '2025-11-28', 'CASH', 'COLDROOM', '109.0', NOW());
  END IF;
  -- Kwadwo Addo (238)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '238' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-01', 'CASH', 'EMBALMING', '243.0', NOW());
  END IF;
  -- Akosua Nyamekye (239)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '239' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-03', 'CASH', 'EMBALMING', '244.0', NOW());
  END IF;
  -- Emmanuel Kuma Tagbor (240)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '240' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-03', 'CASH', 'EMBALMING', '245.0', NOW());
  END IF;
  -- Solo Gadzi Atikpoe (241)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '241' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-11-02', 'CASH', 'REGISTRATION', '111.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-02', 'CASH', 'EMBALMING', '246.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 728.0, '2025-11-29', 'CASH', 'COLDROOM', '111.0', NOW());
  END IF;
  -- Isaac Kwadwo Agyei (242)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '242' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-11-03', 'CASH', 'REGISTRATION', '119.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-03', 'CASH', 'EMBALMING', '247.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 832.0, '2025-12-04', 'CASH', 'COLDROOM', '119.0', NOW());
  END IF;
  -- Dina Appiah (243)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '243' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-03', 'CASH', 'EMBALMING', '248.0', NOW());
  END IF;
  -- Solomon Nuadeke (244)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '244' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-07', 'CASH', 'EMBALMING', '249.0', NOW());
  END IF;
  -- Rosemond Amoako (245)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '245' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-10', 'CASH', 'EMBALMING', '250.0', NOW());
  END IF;
  -- Doris (246)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '246' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-11-10', 'CASH', 'REGISTRATION', '245.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-10', 'CASH', 'EMBALMING', '251.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 182.0, '2025-11-16', 'CASH', 'COLDROOM', '245.0', NOW());
  END IF;
  -- Richmond Asamoah (247)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '247' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-11', 'CASH', 'EMBALMING', '252.0', NOW());
  END IF;
  -- Naomi Nuadeke (248)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '248' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-11', 'CASH', 'EMBALMING', '253.0', NOW());
  END IF;
  -- Samuel Akwasi Acheampong (249)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '249' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-12', 'CASH', 'EMBALMING', '254.0', NOW());
  END IF;
  -- Kwabena Marfo (250)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '250' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-13', 'CASH', 'EMBALMING', '255.0', NOW());
  END IF;
  -- Gifty Ampofo (251)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '251' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-13', 'CASH', 'EMBALMING', '256.0', NOW());
  END IF;
  -- Regina Serwaa Ampofo (252)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '252' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-15', 'CASH', 'EMBALMING', '257.0', NOW());
  END IF;
  -- Aku Ankrah (253)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '253' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-15', 'CASH', 'EMBALMING', '258.0', NOW());
  END IF;
  -- Adu Kofi (254)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '254' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-17', 'CASH', 'EMBALMING', '259.0', NOW());
  END IF;
  -- Louis Yaw Doku (255)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '255' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-20', 'CASH', 'EMBALMING', '260.0', NOW());
  END IF;
  -- Comfort Odentaa (256)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '256' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-25', 'CASH', 'EMBALMING', '261.0', NOW());
  END IF;
  -- Veronica Aku Amedi (257)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '257' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-26', 'CASH', 'EMBALMING', '262.0', NOW());
  END IF;
  -- Emmanuel Asante (258)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '258' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-26', 'CASH', 'EMBALMING', '263.0', NOW());
  END IF;
  -- Emmanuel Tettey (259)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '259' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-26', 'CASH', 'EMBALMING', '264.0', NOW());
  END IF;
  -- Christina Affum (260)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '260' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-27', 'CASH', 'EMBALMING', '265.0', NOW());
  END IF;
  -- Yaw Antwi (261)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '261' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-11-27', 'CASH', 'EMBALMING', '266.0', NOW());
  END IF;
  -- Kwabena Abrokwah (262)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '262' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-12-02', 'CASH', 'EMBALMING', '267.0', NOW());
  END IF;
  -- Janet Ampofowaa Amponsah (263)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '263' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-12-03', 'CASH', 'EMBALMING', '268.0', NOW());
  END IF;
  -- Priana Odame (264)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '264' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 350.0, '2025-12-03', 'CASH', 'REGISTRATION', '121.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-12-03', 'CASH', 'EMBALMING', '269.0', NOW());
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 104.0, '2025-12-06', 'CASH', 'COLDROOM', '121.0', NOW());
  END IF;
  -- Celestial Awuku Nyarko (265)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '265' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-12-05', 'CASH', 'EMBALMING', '270.0', NOW());
  END IF;
  -- Regina Brakoaa (266)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '266' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-12-05', 'CASH', 'EMBALMING', '271.0', NOW());
  END IF;
  -- Maxwell Owusu (267)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '267' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-12-08', 'CASH', 'EMBALMING', '272.0', NOW());
  END IF;
  -- Kwabena Sakyiama (268)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '268' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-12-06', 'CASH', 'EMBALMING', '273.0', NOW());
  END IF;
  -- Akua Oforiwaa Anane (269)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '269' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-12-08', 'CASH', 'EMBALMING', '274.0', NOW());
  END IF;
  -- Esi Agyarkwaa (270)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '270' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-12-11', 'CASH', 'EMBALMING', '275.0', NOW());
  END IF;
  -- Mary Afia Akakpo (271)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '271' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-12-13', 'CASH', 'EMBALMING', '276.0', NOW());
  END IF;
  -- Nana Larjder Kabutey (272)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '272' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-12-15', 'CASH', 'EMBALMING', '277.0', NOW());
  END IF;
  -- Thomas Frimpong (273)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '273' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-12-19', 'CASH', 'EMBALMING', '278.0', NOW());
  END IF;
  -- Tetteh Kwabena (274)
  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '274' AND branch_id = v_branch_id;
  IF v_case_id IS NOT NULL THEN
    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, 50.0, '2025-12-24', 'CASH', 'EMBALMING', '279.0', NOW());
  END IF;

  -- Update total_paid and balance for all cases
  UPDATE deceased_cases c SET
    total_paid = COALESCE((SELECT SUM(amount) FROM payments p WHERE p.case_id = c.id), 0),
    balance = c.total_bill - COALESCE((SELECT SUM(amount) FROM payments p WHERE p.case_id = c.id), 0)
  WHERE branch_id = v_branch_id;
END $$;
