-- =============================================
-- ASUOM RECORDS DATA IMPORT
-- =============================================
-- Generated: 2025-12-26 10:04:25
-- Total Records: 275
-- Default Embalming Fee: GHS 50.0
-- =============================================

-- Get the Asuom Branch ID
DO $$
DECLARE
  v_branch_id UUID;
BEGIN
  -- Get Asuom Branch ID
  SELECT id INTO v_branch_id FROM branches WHERE name = 'Asuom Branch' LIMIT 1;

  IF v_branch_id IS NULL THEN
    RAISE EXCEPTION 'Asuom Branch not found! Please run rename_to_asuom.sql first.';
  END IF;

  -- Insert records

  -- Record 1: Kwame Agbanyi
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '001',
    'Kwame Agbanyi',
    85,
    'Male',
    '',
    '2024-07-30',
    '07:30:00',
    'Normal',
    'DISCHARGED',
    '2024-08-29',
    31,
    'Boateng S. Kojo',
    '542052248',
    350.0,
    50.0,
    325.0,
    403.0,
    1128.0,
    0.0,
    1128.0,
    '1.0',
    '1.0'
  );

  -- Record 2: Kwabena Nyame
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '002',
    'Kwabena Nyame',
    100,
    'Male',
    '',
    '2024-08-01',
    '12:00:00',
    'Normal',
    'DISCHARGED',
    '2024-08-30',
    30,
    'Kofi Obeng',
    '548191078',
    350.0,
    50.0,
    403.0,
    390.0,
    1193.0,
    0.0,
    1193.0,
    '2.0',
    '2.0'
  );

  -- Record 3: Joseph Awuah Gyimah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '003',
    'Joseph Awuah Gyimah',
    77,
    'Male',
    '',
    '2024-08-04',
    '22:10:00',
    'Normal',
    'DISCHARGED',
    '2024-11-01',
    90,
    'Kwabena Antwi',
    '594177443',
    350.0,
    50.0,
    1170.0,
    1170.0,
    2740.0,
    0.0,
    2740.0,
    '3.0',
    '12.0'
  );

  -- Record 4: Akos Aboagyewaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '004',
    'Akos Aboagyewaa',
    64,
    'Female',
    '',
    '2024-08-09',
    '09:41:00',
    'Normal',
    'DISCHARGED',
    '2024-09-20',
    43,
    'Awal Clement',
    '248465456',
    350.0,
    50.0,
    559.0,
    559.0,
    1518.0,
    0.0,
    1518.0,
    '4.0',
    '5.0'
  );

  -- Record 5: Kwame
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '005',
    'Kwame',
    45,
    'Male',
    '',
    '2024-08-15',
    '23:30:00',
    'Normal',
    'DISCHARGED',
    '2024-09-06',
    23,
    'Ohene Ofori',
    '554596352',
    350.0,
    50.0,
    299.0,
    299.0,
    998.0,
    0.0,
    998.0,
    '5.0',
    '4.0'
  );

  -- Record 6: Emmanuel Osei
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '006',
    'Emmanuel Osei',
    85,
    'Male',
    '',
    '2024-08-16',
    '07:30:00',
    'Normal',
    'DISCHARGED',
    '2024-09-08',
    24,
    'Agbeko',
    '247194693',
    350.0,
    50.0,
    1105.0,
    312.0,
    1817.0,
    0.0,
    1817.0,
    '6.0',
    '14.0'
  );

  -- Record 7: Kwabena Asiamah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '007',
    'Kwabena Asiamah',
    61,
    'Male',
    '',
    '2024-08-16',
    '12:00:00',
    'Normal',
    'DISCHARGED',
    '2024-11-29',
    106,
    'Yaw Frimpong',
    '557518754',
    350.0,
    50.0,
    1378.0,
    1378.0,
    3156.0,
    0.0,
    3156.0,
    '7.0',
    '24.0'
  );

  -- Record 8: Dorothy Koranteng
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '008',
    'Dorothy Koranteng',
    36,
    'Female',
    '',
    '2024-08-18',
    '07:59:00',
    'Normal',
    'DISCHARGED',
    '2024-08-31',
    14,
    'Kwabena Marfo',
    '247916087',
    350.0,
    50.0,
    182.0,
    182.0,
    764.0,
    0.0,
    764.0,
    '8.0',
    '3.0'
  );

  -- Record 9: Nicholas Appiah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '009',
    'Nicholas Appiah',
    82,
    'Male',
    '',
    '2024-08-20',
    '05:45:00',
    'Normal',
    'DISCHARGED',
    '2025-03-07',
    200,
    'Kwame Asomaning',
    '241282104',
    350.0,
    50.0,
    2600.0,
    2600.0,
    5600.0,
    0.0,
    5600.0,
    '9.0',
    '39.0'
  );

  -- Record 10: Frimpong Manso
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '010',
    'Frimpong Manso',
    86,
    'Male',
    '',
    '2024-08-25',
    '12:45:00',
    'Normal',
    'DISCHARGED',
    '2024-11-29',
    97,
    'Kwame Frimpong',
    '241406611',
    350.0,
    50.0,
    1261.0,
    1261.0,
    2922.0,
    0.0,
    2922.0,
    '10.0',
    '19.0'
  );

  -- Record 11: Ama Asiedua
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '011',
    'Ama Asiedua',
    67,
    'Female',
    '',
    '2024-08-28',
    '14:52:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    213,
    'Kwadwo Yeboah',
    '247422898',
    350.0,
    50.0,
    2769.0,
    2769.0,
    5938.0,
    0.0,
    5938.0,
    '11.0',
    '59.0'
  );

  -- Record 12: Elizabeth Anane
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '012',
    'Elizabeth Anane',
    60,
    'Female',
    '',
    '2024-08-28',
    '21:35:00',
    'Normal',
    'DISCHARGED',
    '2025-04-25',
    241,
    'Mrs. Mary',
    '244658173',
    350.0,
    50.0,
    3133.0,
    3133.0,
    6666.0,
    0.0,
    6666.0,
    '12.0',
    '86.0'
  );

  -- Record 13: Alex Yeboah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '013',
    'Alex Yeboah',
    66,
    'Male',
    '',
    '2024-08-30',
    '14:45:00',
    'Normal',
    'DISCHARGED',
    '2024-11-01',
    64,
    'Kwabena Owusu',
    '537288927',
    350.0,
    50.0,
    832.0,
    832.0,
    2064.0,
    0.0,
    2064.0,
    '13.0',
    '13.0'
  );

  -- Record 14: Teye Louis
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '014',
    'Teye Louis',
    56,
    'Male',
    '',
    '2024-09-01',
    '10:20:00',
    'Normal',
    'DISCHARGED',
    '2024-11-29',
    90,
    'Larbi John',
    '249016355',
    350.0,
    50.0,
    1170.0,
    1170.0,
    2740.0,
    0.0,
    2740.0,
    '14.0',
    '18.0'
  );

  -- Record 15: Kwaku Aboagye
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '015',
    'Kwaku Aboagye',
    45,
    'Male',
    '',
    '2024-09-03',
    '17:40:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    207,
    'Mr. Patrick',
    '538512798',
    350.0,
    50.0,
    2691.0,
    2691.0,
    5782.0,
    0.0,
    5782.0,
    '15.0',
    '61.0'
  );

  -- Record 16: Evans Kyei
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '016',
    'Evans Kyei',
    31,
    'Male',
    '',
    '2024-09-04',
    '14:42:00',
    'Normal',
    'DISCHARGED',
    '2024-11-29',
    87,
    'Asante Samuel',
    '541731399',
    350.0,
    50.0,
    1131.0,
    1131.0,
    2662.0,
    0.0,
    2662.0,
    '16.0',
    '17.0'
  );

  -- Record 17: Eric Obeng
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '017',
    'Eric Obeng',
    37,
    'Male',
    '',
    '2024-09-02',
    '17:30:00',
    'Normal',
    'DISCHARGED',
    '2024-11-01',
    61,
    'Mr. Boadu',
    '242348436',
    350.0,
    50.0,
    793.0,
    793.0,
    1986.0,
    0.0,
    1986.0,
    '17.0',
    '9.0'
  );

  -- Record 18: Kojo Sarfo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '018',
    'Kojo Sarfo',
    78,
    'Male',
    '',
    '2024-09-08',
    '10:00:00',
    'Normal',
    'DISCHARGED',
    '2024-11-01',
    55,
    'Yaw Poku',
    '242089665',
    350.0,
    50.0,
    715.0,
    715.0,
    1830.0,
    0.0,
    1830.0,
    '18.0',
    '7.0'
  );

  -- Record 19: Mary Tikromah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '019',
    'Mary Tikromah',
    75,
    'Female',
    '',
    '2024-09-08',
    '16:30:00',
    'Normal',
    'DISCHARGED',
    '2025-04-25',
    230,
    'Fobi Jones',
    '243672593',
    350.0,
    50.0,
    2990.0,
    2990.0,
    6380.0,
    0.0,
    6380.0,
    '19.0',
    '87.0'
  );

  -- Record 20: Kwasi Fenting
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '020',
    'Kwasi Fenting',
    77,
    'Male',
    '',
    '2024-09-10',
    '06:30:00',
    'Normal',
    'DISCHARGED',
    '2025-05-30',
    263,
    'Thomas Peprah',
    '243919853',
    350.0,
    50.0,
    3016.0,
    3419.0,
    6835.0,
    0.0,
    6835.0,
    '20.0',
    '155.0'
  );

  -- Record 21: Vida Adomaa Yaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '021',
    'Vida Adomaa Yaa',
    45,
    'Female',
    '',
    '2024-09-09',
    '20:00:00',
    'Normal',
    'DISCHARGED',
    '2024-09-27',
    19,
    'Nti Amoako',
    '241621310',
    350.0,
    50.0,
    247.0,
    247.0,
    894.0,
    0.0,
    894.0,
    '21.0',
    '6.0'
  );

  -- Record 22: Ohene Asiedu
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '022',
    'Ohene Asiedu',
    73,
    'Male',
    '',
    '2024-09-11',
    '21:30:00',
    'Normal',
    'DISCHARGED',
    '2024-11-01',
    52,
    'Mr. Kofi',
    '249942477',
    350.0,
    50.0,
    676.0,
    676.0,
    1752.0,
    0.0,
    1752.0,
    '22.0',
    '10.0'
  );

  -- Record 23: Samuel Dankyei
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '023',
    'Samuel Dankyei',
    76,
    'Male',
    '',
    '2024-09-11',
    '17:30:00',
    'Normal',
    'DISCHARGED',
    '2024-11-29',
    80,
    'Oduro Kwame',
    '547641510',
    350.0,
    50.0,
    1040.0,
    1040.0,
    2480.0,
    0.0,
    2480.0,
    '23.0',
    '21.0'
  );

  -- Record 24: Margaret Abena
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '024',
    'Margaret Abena',
    53,
    'Female',
    '',
    '2024-09-17',
    '11:20:00',
    'Normal',
    'DISCHARGED',
    '2024-10-11',
    25,
    'Adam Jones',
    '243625448',
    350.0,
    50.0,
    325.0,
    325.0,
    1050.0,
    0.0,
    1050.0,
    '24.0',
    '8.0'
  );

  -- Record 25: Kwasi Anane
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '025',
    'Kwasi Anane',
    83,
    'Male',
    '',
    '2024-09-17',
    '18:30:00',
    'Normal',
    'DISCHARGED',
    '2024-11-29',
    74,
    'Stephen Amaning',
    '553066025',
    350.0,
    50.0,
    962.0,
    962.0,
    2324.0,
    0.0,
    2324.0,
    '25.0',
    '20.0'
  );

  -- Record 26: Samuel Antwi
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '026',
    'Samuel Antwi',
    35,
    'Male',
    '',
    '2024-09-25',
    '07:30:00',
    'Normal',
    'DISCHARGED',
    '2024-11-29',
    66,
    'King Asiedu',
    '244127358',
    350.0,
    50.0,
    858.0,
    858.0,
    2116.0,
    0.0,
    2116.0,
    '26.0',
    '23.0'
  );

  -- Record 27: Grace Dzaka
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '027',
    'Grace Dzaka',
    42,
    'Female',
    '',
    '2024-09-25',
    '18:30:00',
    'Normal',
    'DISCHARGED',
    '2024-11-29',
    66,
    'Yaw Dzaka',
    '551133790',
    350.0,
    50.0,
    858.0,
    858.0,
    2116.0,
    0.0,
    2116.0,
    '27.0',
    '25.0'
  );

  -- Record 28: Kwaku Twum
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '028',
    'Kwaku Twum',
    49,
    'Male',
    '',
    '2024-09-30',
    '16:00:00',
    'Normal',
    'DISCHARGED',
    '2024-11-29',
    61,
    'Kwabena Darkwah',
    '246930176',
    350.0,
    50.0,
    793.0,
    793.0,
    1986.0,
    0.0,
    1986.0,
    '28.0',
    '22.0'
  );

  -- Record 29: Raphael Tettey
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '029',
    'Raphael Tettey',
    53,
    'Male',
    '',
    '2024-10-01',
    '11:16:00',
    'Normal',
    'DISCHARGED',
    '2024-11-22',
    53,
    'Mr. Nartey',
    '242857647',
    350.0,
    50.0,
    1060.0,
    689.0,
    2149.0,
    0.0,
    2149.0,
    '29.0',
    '16.0'
  );

  -- Record 30: Akosua Manu
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '030',
    'Akosua Manu',
    62,
    'Female',
    '',
    '2024-10-02',
    '14:50:00',
    'Normal',
    'DISCHARGED',
    '2025-03-07',
    157,
    'Mr. Kwame',
    '244788073',
    350.0,
    50.0,
    2132.0,
    2041.0,
    4573.0,
    0.0,
    4573.0,
    '30.0',
    '38.0'
  );

  -- Record 31: Kwame Appiah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '031',
    'Kwame Appiah',
    65,
    'Male',
    '',
    '2024-10-06',
    '17:25:00',
    'Normal',
    'DISCHARGED',
    '2024-11-15',
    41,
    'Kwame Okyere',
    '543253088',
    350.0,
    50.0,
    533.0,
    533.0,
    1466.0,
    0.0,
    1466.0,
    '31.0',
    '15.0'
  );

  -- Record 32: Mercy Gyaubea
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '032',
    'Mercy Gyaubea',
    90,
    'Female',
    '',
    '2024-10-07',
    '17:30:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    173,
    'Ebenezer Larbi',
    '246758274',
    350.0,
    50.0,
    2249.0,
    2249.0,
    4898.0,
    0.0,
    4898.0,
    '32.0',
    '65.0'
  );

  -- Record 33: Janet Amissah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '033',
    'Janet Amissah',
    70,
    'Female',
    '',
    '2024-10-10',
    '13:30:00',
    'VIP',
    'DISCHARGED',
    '2025-04-25',
    198,
    'Mr. Alex',
    '537892477',
    350.0,
    50.0,
    3960.0,
    3960.0,
    8320.0,
    0.0,
    8320.0,
    '33.0',
    '84.0'
  );

  -- Record 34: Charlotte Addo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '034',
    'Charlotte Addo',
    23,
    'Female',
    '',
    '2024-10-11',
    '17:30:00',
    'VIP',
    'DISCHARGED',
    '2025-03-27',
    168,
    'Michael Addo',
    '536658995',
    350.0,
    50.0,
    3360.0,
    3360.0,
    7120.0,
    0.0,
    7120.0,
    '34.0',
    '54.0'
  );

  -- Record 35: Affum Joseph
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '035',
    'Affum Joseph',
    60,
    'Male',
    '',
    '2024-10-12',
    '08:00:00',
    'Normal',
    'DISCHARGED',
    '2024-11-01',
    21,
    'J. K. Affum',
    '543965476',
    350.0,
    50.0,
    273.0,
    273.0,
    946.0,
    0.0,
    946.0,
    '35.0',
    '11.0'
  );

  -- Record 36: Kwaku Osei
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '036',
    'Kwaku Osei',
    55,
    'Male',
    '',
    '2024-10-11',
    '20:00:00',
    'Normal',
    'DISCHARGED',
    '2025-02-21',
    134,
    'Anokye Wilson',
    '550267435',
    350.0,
    50.0,
    1742.0,
    1742.0,
    3884.0,
    0.0,
    3884.0,
    '36.0',
    '33.0'
  );

  -- Record 37: Ofori Richard
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '037',
    'Ofori Richard',
    36,
    'Male',
    '',
    '2024-10-13',
    '18:00:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    167,
    'Jacob Danso',
    '592684635',
    350.0,
    50.0,
    2171.0,
    2171.0,
    4742.0,
    0.0,
    4742.0,
    '37.0',
    '43.0'
  );

  -- Record 38: James Tetteh
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '038',
    'James Tetteh',
    80,
    'Male',
    '',
    '2024-10-18',
    '06:00:00',
    'VIP',
    'DISCHARGED',
    '2025-03-14',
    148,
    'John Tetteh',
    '245078950',
    350.0,
    50.0,
    2960.0,
    2960.0,
    6320.0,
    0.0,
    6320.0,
    '38.0',
    '42.0'
  );

  -- Record 39: Akosua Oforiwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '039',
    'Akosua Oforiwaa',
    74,
    'Female',
    '',
    '2024-10-18',
    '21:00:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    162,
    'Yaw Aniagyei',
    '597766781',
    350.0,
    50.0,
    2106.0,
    2106.0,
    4612.0,
    0.0,
    4612.0,
    '39.0',
    '62.0'
  );

  -- Record 40: Ransford Asiedu
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '040',
    'Ransford Asiedu',
    62,
    'Male',
    '',
    '2024-10-21',
    '16:00:00',
    'Normal',
    'DISCHARGED',
    '2025-05-30',
    222,
    'Mr. Jones',
    '243672593',
    350.0,
    50.0,
    2886.0,
    2886.0,
    6172.0,
    0.0,
    6172.0,
    '40.0',
    '96.0'
  );

  -- Record 41: Kofi Okyere
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '041',
    'Kofi Okyere',
    80,
    'Male',
    '',
    '2024-10-22',
    '14:50:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    158,
    'Bomsu Poku',
    '599702518',
    350.0,
    50.0,
    2054.0,
    2054.0,
    4508.0,
    0.0,
    4508.0,
    '41.0',
    '55.0'
  );

  -- Record 42: Samuel Mintah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '042',
    'Samuel Mintah',
    71,
    'Male',
    '',
    '2024-10-22',
    '18:00:00',
    'Normal',
    'DISCHARGED',
    '2025-02-21',
    123,
    'Daniel Tetteh',
    '549548828',
    350.0,
    50.0,
    1599.0,
    1599.0,
    3598.0,
    0.0,
    3598.0,
    '42.0',
    '31.0'
  );

  -- Record 43: Akwasi Tawiah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '043',
    'Akwasi Tawiah',
    55,
    'Male',
    '',
    '2024-10-23',
    '16:40:00',
    'Normal',
    'DISCHARGED',
    '2025-05-30',
    220,
    'Mr. Yaw',
    '598796666',
    350.0,
    50.0,
    2860.0,
    2860.0,
    6120.0,
    0.0,
    6120.0,
    '43.0',
    '90.0'
  );

  -- Record 44: Nti Aninkorah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '044',
    'Nti Aninkorah',
    75,
    'Male',
    '',
    '2024-10-29',
    '10:35:00',
    'Normal',
    'DISCHARGED',
    '2025-04-25',
    179,
    'Paul Peprah',
    '246782477',
    350.0,
    50.0,
    2327.0,
    2327.0,
    5054.0,
    0.0,
    5054.0,
    '44.0',
    '81.0'
  );

  -- Record 45: Kwao Juliana
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '045',
    'Kwao Juliana',
    60,
    'Female',
    '',
    '2024-11-01',
    '12:00:00',
    'VIP',
    'DISCHARGED',
    '2025-05-02',
    183,
    'Kwao Branie',
    '591411684',
    350.0,
    50.0,
    2860.0,
    3660.0,
    6920.0,
    0.0,
    6920.0,
    '45.0',
    '97.0'
  );

  -- Record 46: S. A. Adu
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '046',
    'S. A. Adu',
    85,
    'Male',
    '',
    '2024-11-06',
    '05:00:00',
    'VIP',
    'DISCHARGED',
    '2025-04-25',
    171,
    'Yaw Antwi',
    '249608599',
    350.0,
    50.0,
    3420.0,
    3420.0,
    7240.0,
    0.0,
    7240.0,
    '46.0',
    '78.0'
  );

  -- Record 47: Rose Ayimaah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '047',
    'Rose Ayimaah',
    56,
    'Female',
    '',
    '2024-11-08',
    '05:30:00',
    'Normal',
    'DISCHARGED',
    '2025-01-31',
    85,
    'Cecilia Ntiriwaa',
    '592417150',
    350.0,
    50.0,
    1105.0,
    1105.0,
    2610.0,
    0.0,
    2610.0,
    '47.0',
    '27.0'
  );

  -- Record 48: Comfort M. Treku
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '048',
    'Comfort M. Treku',
    79,
    'Female',
    '',
    '2024-11-08',
    '13:00:00',
    'Normal',
    'DISCHARGED',
    '2025-03-07',
    120,
    'Mr. Emmanuel',
    '245427262',
    350.0,
    50.0,
    1469.0,
    1560.0,
    3429.0,
    0.0,
    3429.0,
    '48.0',
    '30.0'
  );

  -- Record 49: Hayford Nyarko
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '049',
    'Hayford Nyarko',
    73,
    'Male',
    '',
    '2024-11-16',
    '12:00:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    133,
    'Eugene',
    '531488948',
    350.0,
    50.0,
    1729.0,
    1729.0,
    3858.0,
    0.0,
    3858.0,
    '49.0',
    '64.0'
  );

  -- Record 50: Yaw Asiedu
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '050',
    'Yaw Asiedu',
    82,
    'Male',
    '',
    '2024-11-16',
    '17:30:00',
    'VIP',
    'DISCHARGED',
    '2025-01-31',
    77,
    'Bro Kwasi',
    '245461941',
    350.0,
    50.0,
    1540.0,
    1540.0,
    3480.0,
    0.0,
    3480.0,
    '50.0',
    '28.0'
  );

  -- Record 51: Gifty Apochie
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '051',
    'Gifty Apochie',
    40,
    'Female',
    '',
    '2024-11-18',
    '12:00:00',
    'Normal',
    'DISCHARGED',
    '2025-02-21',
    96,
    'Ishmael Apochie',
    '541938360',
    350.0,
    50.0,
    1920.0,
    1248.0,
    3568.0,
    0.0,
    3568.0,
    '51.0',
    '34.0'
  );

  -- Record 52: Mercy Nyarkowaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '052',
    'Mercy Nyarkowaa',
    70,
    'Female',
    '',
    '2024-11-22',
    '06:00:00',
    'VIP',
    'DISCHARGED',
    '2025-05-30',
    190,
    'Mr. Eric Adu',
    '591349206',
    350.0,
    50.0,
    3800.0,
    3800.0,
    8000.0,
    0.0,
    8000.0,
    '52.0',
    '91.0'
  );

  -- Record 53: Janet Awal
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '053',
    'Janet Awal',
    42,
    'Female',
    '',
    '2024-11-25',
    '06:00:00',
    'Normal',
    'DISCHARGED',
    '2025-02-21',
    89,
    'Nicholas Asare',
    '242122292',
    350.0,
    50.0,
    1157.0,
    1157.0,
    2714.0,
    0.0,
    2714.0,
    '53.0',
    '36.0'
  );

  -- Record 54: Kojo Brako
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '054',
    'Kojo Brako',
    56,
    'Male',
    '',
    '2024-11-23',
    '18:30:00',
    'VIP',
    'DISCHARGED',
    '2025-03-28',
    126,
    'Eric Adu',
    '591349206',
    350.0,
    50.0,
    2520.0,
    2520.0,
    5440.0,
    0.0,
    5440.0,
    '54.0',
    '68.0'
  );

  -- Record 55: Grace Ankamaah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '055',
    'Grace Ankamaah',
    87,
    'Female',
    '',
    '2024-11-28',
    '12:32:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    121,
    'Godfred Ofosu',
    '245209916',
    350.0,
    50.0,
    1573.0,
    1573.0,
    3546.0,
    0.0,
    3546.0,
    '55.0',
    '48.0'
  );

  -- Record 56: Afia Takyiwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '056',
    'Afia Takyiwaa',
    80,
    'Female',
    '',
    '2024-11-29',
    '12:42:00',
    'VIP',
    'DISCHARGED',
    '2025-03-07',
    99,
    'Mr. Tetteh',
    '247570112',
    350.0,
    50.0,
    1980.0,
    1980.0,
    4360.0,
    0.0,
    4360.0,
    '56.0',
    '40.0'
  );

  -- Record 57: Desmond D. George
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '057',
    'Desmond D. George',
    62,
    'Male',
    '',
    '2024-12-01',
    '20:00:00',
    'Normal',
    'DISCHARGED',
    '2025-03-07',
    97,
    'Mr. Thomas',
    '544229344',
    350.0,
    50.0,
    1261.0,
    1261.0,
    2922.0,
    0.0,
    2922.0,
    '57.0',
    '37.0'
  );

  -- Record 58: Paul Agyenim B.
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '058',
    'Paul Agyenim B.',
    64,
    'Male',
    '',
    '2024-12-02',
    '14:43:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    117,
    'Agyapong Alexander',
    '240097477',
    350.0,
    50.0,
    1521.0,
    1521.0,
    3442.0,
    0.0,
    3442.0,
    '58.0',
    '69.0'
  );

  -- Record 59: Yaw A.
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '059',
    'Yaw A.',
    43,
    'Male',
    '',
    '2024-11-30',
    '19:00:00',
    'Normal',
    'DISCHARGED',
    '2024-12-15',
    16,
    'Mr. Owusu',
    '532467807',
    350.0,
    50.0,
    208.0,
    208.0,
    816.0,
    0.0,
    816.0,
    '59.0',
    '26.0'
  );

  -- Record 60: Kwaku Samuel
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '060',
    'Kwaku Samuel',
    60,
    'Male',
    '',
    '2024-12-13',
    '07:00:00',
    'VIP',
    'DISCHARGED',
    '2025-03-21',
    99,
    'Isaac Tetteh',
    '598241643',
    350.0,
    50.0,
    1980.0,
    1980.0,
    4360.0,
    0.0,
    4360.0,
    '60.0',
    '51.0'
  );

  -- Record 61: Teye Amayo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '061',
    'Teye Amayo',
    65,
    'Male',
    '',
    '2024-12-15',
    '19:30:00',
    'Normal',
    'DISCHARGED',
    '2025-03-21',
    97,
    'Mr. Quarshie',
    '544817091',
    350.0,
    50.0,
    1261.0,
    1261.0,
    2922.0,
    0.0,
    2922.0,
    '61.0',
    '49.0'
  );

  -- Record 62: Patrick Ankomani
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '062',
    'Patrick Ankomani',
    64,
    'Male',
    '',
    '2024-12-17',
    '07:30:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    102,
    'Mr. Patrick',
    '594120618',
    350.0,
    50.0,
    1326.0,
    1326.0,
    3052.0,
    0.0,
    3052.0,
    '62.0',
    '60.0'
  );

  -- Record 63: Augustina Anima
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '063',
    'Augustina Anima',
    52,
    'Female',
    '',
    '2024-12-18',
    '09:30:00',
    'Normal',
    'DISCHARGED',
    '2025-04-25',
    129,
    'Mr. Darkwa',
    '542668147',
    350.0,
    50.0,
    1677.0,
    1677.0,
    3754.0,
    0.0,
    3754.0,
    '63.0',
    '77.0'
  );

  -- Record 64: Asimeng
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '064',
    'Asimeng',
    41,
    'Male',
    '',
    '2024-12-23',
    '12:00:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    96,
    'Oliver',
    '539843182',
    350.0,
    50.0,
    1248.0,
    1248.0,
    2896.0,
    0.0,
    2896.0,
    '64.0',
    '41.0'
  );

  -- Record 65: Vida Kwakyewaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '065',
    'Vida Kwakyewaa',
    76,
    'Female',
    '',
    '2024-12-23',
    '13:10:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    96,
    'Mr. Frank',
    '243985381',
    350.0,
    50.0,
    1248.0,
    1248.0,
    2896.0,
    0.0,
    2896.0,
    '65.0',
    '66.0'
  );

  -- Record 66: Mary Antwiwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '066',
    'Mary Antwiwaa',
    98,
    'Female',
    '',
    '2024-12-25',
    '17:00:00',
    'Normal',
    'DISCHARGED',
    '2025-07-11',
    199,
    'Nana',
    '531655002',
    350.0,
    50.0,
    2587.0,
    2587.0,
    5574.0,
    0.0,
    5574.0,
    '66.0',
    '171.0'
  );

  -- Record 67: Vida Serwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '067',
    'Vida Serwaa',
    60,
    'Female',
    '',
    '2024-12-27',
    '11:30:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    92,
    'Mr. Ernest',
    '242779227',
    350.0,
    50.0,
    1196.0,
    1196.0,
    2792.0,
    0.0,
    2792.0,
    '67.0',
    '56.0'
  );

  -- Record 68: Christina Darkwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '068',
    'Christina Darkwaa',
    68,
    'Female',
    '',
    '2024-12-27',
    '14:00:00',
    'Normal',
    'DISCHARGED',
    '2025-06-20',
    176,
    'Kwabena Nti',
    '244413097',
    350.0,
    50.0,
    2288.0,
    2288.0,
    4976.0,
    0.0,
    4976.0,
    '68.0',
    '157.0'
  );

  -- Record 69: Comfort  Amponsah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '069',
    'Comfort  Amponsah',
    78,
    'Female',
    '',
    '2024-12-30',
    '12:00:00',
    'Normal',
    'DISCHARGED',
    '2025-05-30',
    152,
    'Mr. Emmanuel',
    '543526522',
    350.0,
    50.0,
    1976.0,
    1976.0,
    4352.0,
    0.0,
    4352.0,
    '69.0',
    '99.0'
  );

  -- Record 70: Korkor Ernestina
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '070',
    'Korkor Ernestina',
    45,
    'Female',
    '',
    '2024-12-31',
    '11:30:00',
    'VIP',
    'DISCHARGED',
    '2025-04-25',
    116,
    'Nartey',
    '245450963',
    350.0,
    50.0,
    2320.0,
    2320.0,
    5040.0,
    0.0,
    5040.0,
    '70.0',
    '85.0'
  );

  -- Record 71: Martha
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '071',
    'Martha',
    80,
    'Female',
    '',
    '2025-01-01',
    '08:00:00',
    'Normal',
    'DISCHARGED',
    '2025-04-25',
    115,
    'Mr. Yeboah',
    '249809015',
    350.0,
    50.0,
    1495.0,
    1495.0,
    3390.0,
    0.0,
    3390.0,
    '71.0',
    '75.0'
  );

  -- Record 72: Atta Akwasi
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '072',
    'Atta Akwasi',
    68,
    'Male',
    '',
    '2025-01-07',
    '17:00:00',
    'VIP',
    'DISCHARGED',
    '2025-04-24',
    108,
    'Kojo Ntiamoah',
    '559677861',
    350.0,
    50.0,
    2160.0,
    2160.0,
    4720.0,
    0.0,
    4720.0,
    '72.0',
    '83.0'
  );

  -- Record 73: Kofi Mensah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '073',
    'Kofi Mensah',
    50,
    'Male',
    '',
    '2025-01-09',
    '11:30:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    79,
    'Mr. Duodu',
    '598055074',
    350.0,
    50.0,
    1027.0,
    1027.0,
    2454.0,
    0.0,
    2454.0,
    '73.0',
    '67.0'
  );

  -- Record 74: Kwabena Ayivi
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '074',
    'Kwabena Ayivi',
    40,
    'Male',
    '',
    '2025-01-16',
    '08:30:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    72,
    'Mr. Atsu',
    '245612360',
    350.0,
    50.0,
    923.0,
    936.0,
    2259.0,
    0.0,
    2259.0,
    '74.0',
    '46.0'
  );

  -- Record 75: Michael Nimo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '075',
    'Michael Nimo',
    30,
    'Male',
    '',
    '2025-01-15',
    '16:30:00',
    'Normal',
    'DISCHARGED',
    '2025-03-14',
    59,
    'Kwasi Nimo',
    '256574842',
    350.0,
    50.0,
    767.0,
    767.0,
    1934.0,
    0.0,
    1934.0,
    '75.0',
    '45.0'
  );

  -- Record 76: Adwoa Beatrice
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '076',
    'Adwoa Beatrice',
    65,
    'Female',
    '',
    '2025-01-19',
    '23:00:00',
    'Normal',
    'DISCHARGED',
    '2025-05-30',
    132,
    'Yaw Amoako',
    '545091696',
    350.0,
    50.0,
    1716.0,
    1716.0,
    3832.0,
    0.0,
    3832.0,
    '76.0',
    '98.0'
  );

  -- Record 77: Akua
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '077',
    'Akua',
    49,
    'Female',
    '',
    '2025-01-18',
    '23:00:00',
    'Normal',
    'DISCHARGED',
    '2025-04-25',
    98,
    'Mr. Samuel',
    '545889088',
    350.0,
    50.0,
    1274.0,
    1274.0,
    2948.0,
    0.0,
    2948.0,
    '77.0',
    '79.0'
  );

  -- Record 78: Ama Nkansah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '078',
    'Ama Nkansah',
    65,
    'Female',
    '',
    '2025-01-22',
    '12:15:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    66,
    'Mr. Oppong',
    '242462633',
    350.0,
    50.0,
    858.0,
    858.0,
    2116.0,
    0.0,
    2116.0,
    '78.0',
    '58.0'
  );

  -- Record 79: Kwaku Adu
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '079',
    'Kwaku Adu',
    55,
    'Male',
    '',
    '2025-01-26',
    '17:15:00',
    'Normal',
    'DISCHARGED',
    '2025-02-21',
    27,
    'Yaw Agyei',
    '249088103',
    350.0,
    50.0,
    351.0,
    351.0,
    1102.0,
    0.0,
    1102.0,
    '79.0',
    '32.0'
  );

  -- Record 80: Ebenezer Kojo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '080',
    'Ebenezer Kojo',
    32,
    'Male',
    '',
    '2025-01-27',
    '08:50:00',
    'Normal',
    'DISCHARGED',
    '2025-11-28',
    306,
    'Alex Boadu',
    '552564368',
    350.0,
    50.0,
    3978.0,
    3978.0,
    8356.0,
    0.0,
    8356.0,
    '80.0',
    '104.0'
  );

  -- Record 81: Hannah Asabea
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '081',
    'Hannah Asabea',
    30,
    'Female',
    '',
    '2025-01-27',
    '05:15:00',
    'Normal',
    'DISCHARGED',
    '2025-07-11',
    166,
    'Emmanuel',
    '556802105',
    350.0,
    50.0,
    2158.0,
    2158.0,
    4716.0,
    0.0,
    4716.0,
    '81.0',
    '169.0'
  );

  -- Record 82: Samson Kofi Mintah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '082',
    'Samson Kofi Mintah',
    77,
    'Male',
    '',
    '2025-01-31',
    '11:00:00',
    'Normal',
    'DISCHARGED',
    '2025-06-06',
    127,
    'Mr. Eric Obuobi',
    '544885861',
    350.0,
    50.0,
    1651.0,
    1651.0,
    3702.0,
    0.0,
    3702.0,
    '82.0',
    '156.0'
  );

  -- Record 83: Akua
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '083',
    'Akua',
    52,
    'Female',
    '',
    '2025-01-30',
    '15:00:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    58,
    'Ampofo Twum',
    '540819359',
    350.0,
    50.0,
    754.0,
    754.0,
    1908.0,
    0.0,
    1908.0,
    '83.0',
    '63.0'
  );

  -- Record 84: George Frimpong
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '084',
    'George Frimpong',
    46,
    'Male',
    '',
    '2025-02-02',
    '16:00:00',
    'Normal',
    'DISCHARGED',
    '2025-02-21',
    20,
    'George Nyarko',
    '598739622',
    350.0,
    50.0,
    260.0,
    260.0,
    920.0,
    0.0,
    920.0,
    '84.0',
    '35.0'
  );

  -- Record 85: Akosua Yeboah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '085',
    'Akosua Yeboah',
    90,
    'Female',
    '',
    '2025-02-04',
    '04:00:00',
    'VIP',
    'DISCHARGED',
    '2025-05-29',
    115,
    'Mr. George',
    '542052299',
    350.0,
    50.0,
    2300.0,
    2300.0,
    5000.0,
    0.0,
    5000.0,
    '85.0',
    '47.0'
  );

  -- Record 86: Yvette Asor
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '086',
    'Yvette Asor',
    20,
    'Female',
    '',
    '2025-02-04',
    '07:00:00',
    'Normal',
    'DISCHARGED',
    '2025-07-11',
    158,
    'William Dompreh',
    '242002826',
    350.0,
    50.0,
    1885.0,
    2054.0,
    4339.0,
    0.0,
    4339.0,
    '86.0',
    '89.0'
  );

  -- Record 87: William Mensah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '087',
    'William Mensah',
    54,
    'Male',
    '',
    '2025-02-04',
    '16:30:00',
    'Normal',
    'DISCHARGED',
    '2025-07-18',
    165,
    'Mr. Attah',
    '543530422',
    350.0,
    50.0,
    2145.0,
    2145.0,
    4690.0,
    0.0,
    4690.0,
    '87.0',
    '172.0'
  );

  -- Record 88: Charles Odurakwa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '088',
    'Charles Odurakwa',
    66,
    'Male',
    '',
    '2025-02-04',
    '19:30:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    53,
    'Mr. George',
    '246425796',
    350.0,
    50.0,
    689.0,
    689.0,
    1778.0,
    0.0,
    1778.0,
    '88.0',
    '53.0'
  );

  -- Record 89: Alex Prah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '089',
    'Alex Prah',
    49,
    'Male',
    '',
    '2025-02-06',
    '12:30:00',
    'Normal',
    'DISCHARGED',
    '2025-02-12',
    7,
    'Mr. Agyei',
    '247200542',
    350.0,
    50.0,
    91.0,
    91.0,
    582.0,
    0.0,
    582.0,
    '89.0',
    '29.0'
  );

  -- Record 90: Margaret Ofosua
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '090',
    'Margaret Ofosua',
    66,
    'Female',
    '',
    '2025-02-09',
    '16:30:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    48,
    'Ama Pokuaa',
    '246282426',
    350.0,
    50.0,
    624.0,
    624.0,
    1648.0,
    0.0,
    1648.0,
    '90.0',
    '57.0'
  );

  -- Record 91: Faustina Sarfoaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '091',
    'Faustina Sarfoaa',
    80,
    'Female',
    '',
    '2025-02-07',
    '15:00:00',
    'Normal',
    'DISCHARGED',
    '2025-08-29',
    204,
    'Mr. Charles',
    '245060415',
    350.0,
    50.0,
    2652.0,
    2652.0,
    5704.0,
    0.0,
    5704.0,
    '91.0',
    '186.0'
  );

  -- Record 92: Stephen Kofi Boateng
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '092',
    'Stephen Kofi Boateng',
    65,
    'Male',
    '',
    '2025-02-11',
    '14:50:00',
    'VIP',
    'DISCHARGED',
    '2025-08-01',
    172,
    'Mr. Adu',
    '540831968',
    350.0,
    50.0,
    3440.0,
    3440.0,
    7280.0,
    0.0,
    7280.0,
    '92.0',
    '179.0'
  );

  -- Record 93: Anane Kwame
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '093',
    'Anane Kwame',
    68,
    'Male',
    '',
    '2025-02-17',
    '12:30:00',
    'Normal',
    'DISCHARGED',
    '2025-04-25',
    68,
    'Amponsah William',
    '245614439',
    350.0,
    50.0,
    884.0,
    884.0,
    2168.0,
    0.0,
    2168.0,
    '93.0',
    '82.0'
  );

  -- Record 94: Beatrice Agyeiwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '094',
    'Beatrice Agyeiwaa',
    73,
    'Female',
    '',
    '2025-02-18',
    '16:00:00',
    'Normal',
    'DISCHARGED',
    '2025-05-30',
    102,
    'Samuel Asare',
    '241167825',
    350.0,
    50.0,
    1326.0,
    1326.0,
    3052.0,
    0.0,
    3052.0,
    '94.0',
    '153.0'
  );

  -- Record 95: Kwabena Ntiamoah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '095',
    'Kwabena Ntiamoah',
    54,
    'Male',
    '',
    '2025-02-15',
    '14:00:00',
    'Normal',
    'DISCHARGED',
    '2025-05-30',
    105,
    'Mrs. Yaa',
    '533225299',
    350.0,
    50.0,
    1365.0,
    1365.0,
    3130.0,
    0.0,
    3130.0,
    '95.0',
    '151.0'
  );

  -- Record 96: Mama Gladys
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '096',
    'Mama Gladys',
    57,
    'Female',
    '',
    '2025-02-20',
    '09:00:00',
    'Normal',
    'DISCHARGED',
    '2025-03-28',
    37,
    'Mr. Kwasi Peprah',
    '243586552',
    350.0,
    50.0,
    481.0,
    481.0,
    1362.0,
    0.0,
    1362.0,
    '96.0',
    '52.0'
  );

  -- Record 97: Regina Odurowaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '097',
    'Regina Odurowaa',
    52,
    'Female',
    '',
    '2025-02-21',
    '12:35:00',
    'Normal',
    'DISCHARGED',
    '2025-05-28',
    97,
    'Mr. Kwaku',
    '241866637',
    350.0,
    50.0,
    1261.0,
    1261.0,
    2922.0,
    0.0,
    2922.0,
    '97.0',
    '92.0'
  );

  -- Record 98: Christina Antwi
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '098',
    'Christina Antwi',
    90,
    'Female',
    '',
    '2025-02-24',
    '05:30:00',
    'VIP',
    'DISCHARGED',
    '2025-10-24',
    243,
    'Gladys Osei',
    '546343905',
    350.0,
    50.0,
    4860.0,
    4860.0,
    10120.0,
    0.0,
    10120.0,
    '98.0',
    '218.0'
  );

  -- Record 99: Kwabena Asiamah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '099',
    'Kwabena Asiamah',
    30,
    'Male',
    '',
    '2025-02-22',
    '21:00:00',
    'Normal',
    'DISCHARGED',
    '2025-04-04',
    42,
    'Bro Kwasi',
    '248055141',
    350.0,
    50.0,
    546.0,
    546.0,
    1492.0,
    0.0,
    1492.0,
    '99.0',
    '70.0'
  );

  -- Record 100: Akosua Otiwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '100',
    'Akosua Otiwaa',
    70,
    'Female',
    '',
    '2025-02-24',
    '19:30:00',
    'Normal',
    'DISCHARGED',
    '2025-04-25',
    61,
    'Oppong George',
    '555270243',
    350.0,
    50.0,
    793.0,
    793.0,
    1986.0,
    0.0,
    1986.0,
    '100.0',
    '80.0'
  );

  -- Record 101: Dora
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '101',
    'Dora',
    33,
    'Female',
    '',
    '2025-02-25',
    '22:30:00',
    'Normal',
    'DISCHARGED',
    '2025-04-25',
    60,
    'Kwabena',
    '256266123',
    350.0,
    50.0,
    780.0,
    780.0,
    1960.0,
    0.0,
    1960.0,
    '101.0',
    '76.0'
  );

  -- Record 102: Antwi Darkwah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '102',
    'Antwi Darkwah',
    75,
    'Male',
    '',
    '2025-02-28',
    '14:00:00',
    'VIP',
    'DISCHARGED',
    '2025-11-13',
    259,
    'Oduro',
    '240655787',
    350.0,
    50.0,
    5180.0,
    5180.0,
    10760.0,
    0.0,
    10760.0,
    '102.0',
    '246.0'
  );

  -- Record 103: Ernestina Sarpeh
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '103',
    'Ernestina Sarpeh',
    60,
    'Female',
    '',
    '2025-03-01',
    '21:00:00',
    'Normal',
    'DISCHARGED',
    '2025-05-30',
    91,
    'Williams',
    '246961726',
    350.0,
    50.0,
    1183.0,
    1183.0,
    2766.0,
    0.0,
    2766.0,
    '103.0',
    '94.0'
  );

  -- Record 104: Victor Gameh
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '104',
    'Victor Gameh',
    50,
    'Male',
    '',
    '2025-02-27',
    '12:00:00',
    'Normal',
    'DISCHARGED',
    '2025-08-22',
    177,
    'Mr. Tettey',
    '247129896',
    350.0,
    50.0,
    2301.0,
    2301.0,
    5002.0,
    0.0,
    5002.0,
    '104.0',
    '182.0'
  );

  -- Record 105: Yaa Love
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '105',
    'Yaa Love',
    30,
    'Female',
    '',
    '2025-03-05',
    '06:20:00',
    'Normal',
    'DISCHARGED',
    '2025-04-25',
    52,
    'Mr. Yaw',
    '257701596',
    350.0,
    50.0,
    676.0,
    676.0,
    1752.0,
    0.0,
    1752.0,
    '105.0',
    '88.0'
  );

  -- Record 106: Yaw Twum
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '106',
    'Yaw Twum',
    76,
    'Male',
    '',
    '2025-03-07',
    '13:52:00',
    'Normal',
    'DISCHARGED',
    '2025-07-11',
    127,
    'Kwasi Obeng',
    '242275892',
    350.0,
    50.0,
    1651.0,
    1651.0,
    3702.0,
    0.0,
    3702.0,
    '106.0',
    '168.0'
  );

  -- Record 107: Akyea Frimpong
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '107',
    'Akyea Frimpong',
    67,
    'Male',
    '',
    '2025-03-08',
    '13:00:00',
    'VIP',
    'DISCHARGED',
    '2025-06-20',
    105,
    'Seth Asiamah',
    '554941605',
    350.0,
    50.0,
    2100.0,
    2100.0,
    4600.0,
    0.0,
    4600.0,
    '107.0',
    '162.0'
  );

  -- Record 108: Asare Antwi
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '108',
    'Asare Antwi',
    38,
    'Male',
    '',
    '2025-03-10',
    '12:32:00',
    'Normal',
    'DISCHARGED',
    '2025-05-30',
    82,
    'Reynolds Antwi',
    '244574077',
    350.0,
    50.0,
    1066.0,
    1066.0,
    2532.0,
    0.0,
    2532.0,
    '109.0',
    '95.0'
  );

  -- Record 109: Ophelia Ama Dede
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '109',
    'Ophelia Ama Dede',
    66,
    'Female',
    '',
    '2025-03-11',
    '16:10:00',
    'VIP',
    'DISCHARGED',
    '2025-08-29',
    172,
    'Edward Appiah',
    '556474751',
    350.0,
    50.0,
    3440.0,
    3440.0,
    7280.0,
    0.0,
    7280.0,
    '111.0',
    '187.0'
  );

  -- Record 110: Darko Dickson
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '110',
    'Darko Dickson',
    61,
    'Male',
    '',
    '2025-03-13',
    '13:04:00',
    'Normal',
    'DISCHARGED',
    '2025-07-11',
    121,
    'Asare Bediako',
    '247292185',
    350.0,
    50.0,
    1573.0,
    1573.0,
    3546.0,
    0.0,
    3546.0,
    '113.0',
    '170.0'
  );

  -- Record 111: Grace Afrah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '111',
    'Grace Afrah',
    77,
    'Female',
    '',
    '2025-03-17',
    '16:15:00',
    'VIP',
    'DISCHARGED',
    '2025-05-30',
    75,
    'Samson Yeboah',
    '245468876',
    350.0,
    50.0,
    1486.0,
    1500.0,
    3386.0,
    0.0,
    3386.0,
    '114.0',
    '93.0'
  );

  -- Record 112: Simon Kofi Odonkor
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '112',
    'Simon Kofi Odonkor',
    64,
    'Male',
    '',
    '2025-03-27',
    '09:58:00',
    'Normal',
    'DISCHARGED',
    '2025-06-27',
    93,
    'Emmanuel Nartey',
    '246635172',
    350.0,
    50.0,
    1209.0,
    1209.0,
    2818.0,
    0.0,
    2818.0,
    '115.0',
    '164.0'
  );

  -- Record 113: Afia Nana
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '113',
    'Afia Nana',
    68,
    'Female',
    '',
    '2025-03-30',
    '17:00:00',
    'VIP',
    'DISCHARGED',
    '2025-04-17',
    19,
    'Philip Antwi',
    '598796666',
    350.0,
    50.0,
    380.0,
    380.0,
    1160.0,
    0.0,
    1160.0,
    '116.0',
    '71.0'
  );

  -- Record 114: Selina Donkor Ofosua
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '114',
    'Selina Donkor Ofosua',
    82,
    'Female',
    '',
    '2025-03-29',
    '14:00:00',
    'Normal',
    'DISCHARGED',
    '2025-10-31',
    217,
    'Dickson Asante',
    '243178994',
    350.0,
    50.0,
    2821.0,
    2821.0,
    6042.0,
    0.0,
    6042.0,
    '117.0',
    '222.0'
  );

  -- Record 115: Mary Nnisin
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '115',
    'Mary Nnisin',
    100,
    'Female',
    '',
    '2025-03-31',
    '20:00:00',
    'Normal',
    'DISCHARGED',
    '2025-08-29',
    152,
    'Isaac Owusu',
    '249640385',
    350.0,
    50.0,
    1776.0,
    1976.0,
    4152.0,
    0.0,
    4152.0,
    '118.0',
    '190.0'
  );

  -- Record 116: Alice Abena Korkor
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '116',
    'Alice Abena Korkor',
    61,
    'Female',
    '',
    '2025-04-06',
    '15:00:00',
    'Normal',
    'DISCHARGED',
    '2025-05-30',
    55,
    'Jonathan Attah',
    '246380664',
    350.0,
    50.0,
    715.0,
    715.0,
    1830.0,
    0.0,
    1830.0,
    '119.0',
    '152.0'
  );

  -- Record 117: Grace Ampofowaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '117',
    'Grace Ampofowaa',
    63,
    'Female',
    '',
    '2025-04-08',
    '11:36:00',
    'VIP',
    'DISCHARGED',
    '2025-08-01',
    116,
    'William Freeme',
    '543280791',
    350.0,
    50.0,
    2320.0,
    2320.0,
    5040.0,
    0.0,
    5040.0,
    '120.0',
    '176.0'
  );

  -- Record 118: Janet Adwapa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '118',
    'Janet Adwapa',
    55,
    'Female',
    '',
    '2025-04-10',
    '20:00:00',
    'VIP',
    'DISCHARGED',
    '2025-08-29',
    142,
    'Ohemeng Denkyira',
    '543171106',
    350.0,
    50.0,
    2540.0,
    2840.0,
    5780.0,
    0.0,
    5780.0,
    '121.0',
    '191.0'
  );

  -- Record 119: Jennifer Kyeraa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '119',
    'Jennifer Kyeraa',
    26,
    'Female',
    '',
    '2025-04-10',
    '23:00:00',
    'VIP',
    'DISCHARGED',
    '2025-06-27',
    79,
    'Kwame Amponsah',
    '',
    350.0,
    50.0,
    1580.0,
    1580.0,
    3560.0,
    0.0,
    3560.0,
    '122.0',
    '161.0'
  );

  -- Record 120: Abena Bedge
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '120',
    'Abena Bedge',
    125,
    'Female',
    '',
    '2025-04-11',
    '14:43:00',
    'Normal',
    'DISCHARGED',
    '2025-06-20',
    71,
    'David Viguro',
    '542030705',
    350.0,
    50.0,
    923.0,
    923.0,
    2246.0,
    0.0,
    2246.0,
    '123.0',
    '158.0'
  );

  -- Record 121: Isaac Kwasi Appiah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '121',
    'Isaac Kwasi Appiah',
    66,
    'Male',
    '',
    '2025-04-14',
    '09:05:00',
    'Normal',
    'DISCHARGED',
    '2025-04-15',
    2,
    'Samuel Dankwah',
    '242310642',
    350.0,
    50.0,
    26.0,
    26.0,
    452.0,
    0.0,
    452.0,
    '124.0',
    '72.0'
  );

  -- Record 122: Alfred Kwaku Gyensah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '122',
    'Alfred Kwaku Gyensah',
    74,
    'Male',
    '',
    '2025-04-11',
    '16:00:00',
    'Normal',
    'DISCHARGED',
    '2025-11-28',
    232,
    'Eric Appiah',
    '559213415',
    350.0,
    50.0,
    3016.0,
    3016.0,
    6432.0,
    0.0,
    6432.0,
    '125.0',
    '249.0'
  );

  -- Record 123: Kwasi George
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '123',
    'Kwasi George',
    62,
    'Male',
    '',
    '2025-04-13',
    '19:00:00',
    'Normal',
    'DISCHARGED',
    '2025-08-29',
    139,
    'Juliana Dede',
    '242827233',
    350.0,
    50.0,
    1807.0,
    1807.0,
    4014.0,
    0.0,
    4014.0,
    '126.0',
    '183.0'
  );

  -- Record 124: Mercy Acheampomaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '124',
    'Mercy Acheampomaa',
    60,
    'Female',
    '',
    '2025-04-14',
    '15:00:00',
    'VIP',
    'DISCHARGED',
    '2025-11-28',
    229,
    'Obeng Amoah',
    '249155143',
    350.0,
    50.0,
    4380.0,
    4580.0,
    9360.0,
    0.0,
    9360.0,
    '127.0',
    '105.0'
  );

  -- Record 125: Mabel Afrah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '125',
    'Mabel Afrah',
    46,
    'Female',
    '',
    '2025-04-14',
    '16:00:00',
    'VIP',
    'DISCHARGED',
    '2025-08-01',
    110,
    'Frank Adomako',
    '244706518',
    350.0,
    50.0,
    2200.0,
    2200.0,
    4800.0,
    0.0,
    4800.0,
    '128.0',
    '175.0'
  );

  -- Record 126: Erica Boakye
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '126',
    'Erica Boakye',
    15,
    'Female',
    '',
    '2025-04-15',
    '14:45:00',
    'Normal',
    'DISCHARGED',
    '2025-04-24',
    10,
    'Kwabena Boakye',
    '556250660',
    350.0,
    50.0,
    130.0,
    130.0,
    660.0,
    0.0,
    660.0,
    '129.0',
    '73.0'
  );

  -- Record 127: Mercy Yeboah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '127',
    'Mercy Yeboah',
    54,
    'Female',
    '',
    '2025-04-16',
    '10:05:00',
    'VIP',
    'DISCHARGED',
    '2025-10-29',
    197,
    'Ohemeng Denkyira',
    '543171106',
    350.0,
    50.0,
    3940.0,
    3940.0,
    8280.0,
    0.0,
    8280.0,
    '130.0',
    '229.0'
  );

  -- Record 128: Joseph Bortey Alabi
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '128',
    'Joseph Bortey Alabi',
    28,
    'Male',
    '',
    '2025-04-16',
    '14:30:00',
    'Normal',
    'DISCHARGED',
    '2025-05-30',
    45,
    'Evans Anyitey',
    '533541189',
    350.0,
    50.0,
    585.0,
    585.0,
    1570.0,
    0.0,
    1570.0,
    '131.0',
    '154.0'
  );

  -- Record 129: Comfort Awo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '129',
    'Comfort Awo',
    75,
    'Female',
    '',
    '2025-04-16',
    '22:30:00',
    'Normal',
    'DISCHARGED',
    '2025-11-21',
    220,
    'James Teye',
    '543475015',
    350.0,
    50.0,
    2760.0,
    2860.0,
    6020.0,
    0.0,
    6020.0,
    '132.0',
    '248.0'
  );

  -- Record 130: Kwame Attah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '130',
    'Kwame Attah',
    60,
    'Male',
    '',
    '2025-04-18',
    '15:30:00',
    'Normal',
    'DISCHARGED',
    '2025-08-01',
    106,
    'Kwame Tawiah',
    '249082610',
    350.0,
    50.0,
    1378.0,
    1378.0,
    3156.0,
    0.0,
    3156.0,
    '133.0',
    '178.0'
  );

  -- Record 131: Yaw Nyarko
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '131',
    'Yaw Nyarko',
    81,
    'Male',
    '',
    '2025-04-19',
    '05:30:00',
    'VIP',
    'DISCHARGED',
    '2025-09-05',
    140,
    'Asiedu Ampong',
    '244126977',
    350.0,
    50.0,
    2800.0,
    2800.0,
    6000.0,
    0.0,
    6000.0,
    '134.0',
    '198.0'
  );

  -- Record 132: Kwasi Yeboah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '132',
    'Kwasi Yeboah',
    50,
    'Male',
    '',
    '2025-04-30',
    '13:30:00',
    'Normal',
    'DISCHARGED',
    '2025-10-31',
    185,
    'Kwame Oduro',
    '243650763',
    350.0,
    50.0,
    2405.0,
    2405.0,
    5210.0,
    0.0,
    5210.0,
    '135.0',
    '242.0'
  );

  -- Record 133: Yaw Mark Adu
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '133',
    'Yaw Mark Adu',
    45,
    'Male',
    '',
    '2025-05-01',
    '09:40:00',
    'Normal',
    'DISCHARGED',
    '2025-07-11',
    72,
    'Yaw Foster Antwi',
    '249608599',
    350.0,
    50.0,
    936.0,
    936.0,
    2272.0,
    0.0,
    2272.0,
    '136.0',
    '165.0'
  );

  -- Record 134: Margaret Boatemaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '134',
    'Margaret Boatemaa',
    78,
    'Female',
    '',
    '2025-05-02',
    '22:00:00',
    'VIP',
    'DISCHARGED',
    '2025-10-03',
    155,
    'Kwame Owusu',
    '246381281',
    350.0,
    50.0,
    3100.0,
    3100.0,
    6600.0,
    0.0,
    6600.0,
    '137.0',
    '203.0'
  );

  -- Record 135: Emmanuel Amoako G.
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '135',
    'Emmanuel Amoako G.',
    81,
    'Male',
    '',
    '2025-05-04',
    '20:00:00',
    'VIP',
    'DISCHARGED',
    '2025-10-31',
    181,
    'Paul Asante',
    '246708361',
    350.0,
    50.0,
    3620.0,
    3620.0,
    7640.0,
    0.0,
    7640.0,
    '138.0',
    '233.0'
  );

  -- Record 136: Joyce Oforiwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '136',
    'Joyce Oforiwaa',
    63,
    'Female',
    '',
    '2025-05-09',
    '11:05:00',
    'VIP',
    'DISCHARGED',
    '2025-08-29',
    113,
    'Thomas Asimeng',
    '553066010',
    350.0,
    50.0,
    2260.0,
    2260.0,
    4920.0,
    0.0,
    4920.0,
    '139.0',
    '194.0'
  );

  -- Record 137: Florence Kumiwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '137',
    'Florence Kumiwaa',
    54,
    'Female',
    '',
    '2025-05-11',
    '15:40:00',
    'Normal',
    'DISCHARGED',
    '2025-08-29',
    111,
    'Samuel Ofori Ampofo',
    '247404050',
    350.0,
    50.0,
    1443.0,
    1443.0,
    3286.0,
    0.0,
    3286.0,
    '140.0',
    '189.0'
  );

  -- Record 138: Noah Teye
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '138',
    'Noah Teye',
    62,
    'Male',
    '',
    '2025-05-15',
    '11:30:00',
    'Normal',
    'DISCHARGED',
    '2025-08-22',
    100,
    'Noah Tettey',
    '245776362',
    350.0,
    50.0,
    1300.0,
    1300.0,
    3000.0,
    0.0,
    3000.0,
    '142.0',
    '184.0'
  );

  -- Record 139: Kwame Agyei
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '139',
    'Kwame Agyei',
    42,
    'Male',
    '',
    '2025-05-20',
    '15:00:00',
    'Normal',
    'DISCHARGED',
    '2025-08-01',
    74,
    'Mark Abrokwah',
    '243660105',
    350.0,
    50.0,
    962.0,
    962.0,
    2324.0,
    0.0,
    2324.0,
    '143.0',
    '180.0'
  );

  -- Record 140: Afia Martha Frimpomaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '140',
    'Afia Martha Frimpomaa',
    59,
    'Female',
    '',
    '2025-05-21',
    '12:00:00',
    'Normal',
    'DISCHARGED',
    '2025-10-31',
    164,
    'Kwame Oduro',
    '536038692',
    350.0,
    50.0,
    2132.0,
    2132.0,
    4664.0,
    0.0,
    4664.0,
    '144.0',
    '234.0'
  );

  -- Record 141: Comfort Appeah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '141',
    'Comfort Appeah',
    60,
    'Female',
    '',
    '2025-05-22',
    '14:00:00',
    'Normal',
    'DISCHARGED',
    '2025-10-31',
    163,
    'Isaac Ofori',
    '537667291',
    350.0,
    50.0,
    2002.0,
    2119.0,
    4521.0,
    0.0,
    4521.0,
    '145.0',
    '231.0'
  );

  -- Record 142: Kwasi Asare
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '142',
    'Kwasi Asare',
    61,
    'Male',
    '',
    '2025-05-23',
    '07:30:00',
    'Normal',
    'DISCHARGED',
    '2025-07-11',
    50,
    'Dickson Nyarko',
    '249810418',
    350.0,
    50.0,
    650.0,
    650.0,
    1700.0,
    0.0,
    1700.0,
    '146.0',
    '167.0'
  );

  -- Record 143: Samuel Nyarko
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '143',
    'Samuel Nyarko',
    65,
    'Male',
    '',
    '2025-05-25',
    '08:00:00',
    'VIP',
    'DISCHARGED',
    '2025-11-28',
    188,
    'Kwaku Darkwah',
    '545753195',
    350.0,
    50.0,
    3560.0,
    3760.0,
    7720.0,
    0.0,
    7720.0,
    '147.0',
    '115.0'
  );

  -- Record 144: Yaa Ntiamoah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '144',
    'Yaa Ntiamoah',
    66,
    'Female',
    '',
    '2025-05-28',
    '07:00:00',
    'VIP',
    'DISCHARGED',
    '2025-08-29',
    94,
    'Samson Twum',
    '248139308',
    350.0,
    50.0,
    1380.0,
    1880.0,
    3660.0,
    0.0,
    3660.0,
    '148.0',
    '196.0'
  );

  -- Record 145: Ebenezer Ofosuhene Antwi
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '145',
    'Ebenezer Ofosuhene Antwi',
    65,
    'Male',
    '',
    '2025-05-29',
    '17:30:00',
    'Normal',
    'DISCHARGED',
    '2025-08-22',
    86,
    'Antwi Benoah',
    '244934551',
    350.0,
    50.0,
    1118.0,
    1118.0,
    2636.0,
    0.0,
    2636.0,
    '149.0',
    '185.0'
  );

  -- Record 146: Yaw Darko
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '146',
    'Yaw Darko',
    63,
    'Male',
    '',
    '2025-06-01',
    '21:30:00',
    'Normal',
    'DISCHARGED',
    '2025-07-11',
    41,
    'Yaw Nimo',
    '599135006',
    350.0,
    50.0,
    533.0,
    533.0,
    1466.0,
    0.0,
    1466.0,
    '150.0',
    '166.0'
  );

  -- Record 147: Comfort Abong
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '147',
    'Comfort Abong',
    80,
    'Female',
    '',
    '2025-05-31',
    '13:30:00',
    'VIP',
    'DISCHARGED',
    '2025-10-31',
    154,
    'Regina Ofosua',
    '543526579',
    350.0,
    50.0,
    3080.0,
    3080.0,
    6560.0,
    0.0,
    6560.0,
    '151.0',
    '240.0'
  );

  -- Record 148: Thomas Peprah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '148',
    'Thomas Peprah',
    70,
    'Male',
    '',
    '2025-06-03',
    '08:00:00',
    'Normal',
    'DISCHARGED',
    '2025-10-03',
    123,
    'Collins Peprah',
    '243586552',
    350.0,
    50.0,
    1599.0,
    1599.0,
    3598.0,
    0.0,
    3598.0,
    '152.0',
    '210.0'
  );

  -- Record 149: Mina Asantewaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '149',
    'Mina Asantewaa',
    100,
    'Female',
    '',
    '2025-06-04',
    '08:30:00',
    'Normal',
    'DISCHARGED',
    '2025-10-03',
    122,
    'Deborah Pokuaa',
    '543683813',
    350.0,
    50.0,
    1200.0,
    1586.0,
    3186.0,
    0.0,
    3186.0,
    '153.0',
    '208.0'
  );

  -- Record 150: Regina Konadu
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '150',
    'Regina Konadu',
    69,
    'Female',
    '',
    '2025-06-03',
    '17:00:00',
    'Normal',
    'IN_CUSTODY',
    '2026-03-27',
    298,
    'Kwadwo Yeboah',
    '247422898',
    350.0,
    50.0,
    1000.0,
    3874.0,
    5274.0,
    0.0,
    5274.0,
    '154.0',
    ''
  );

  -- Record 151: Yawson Asante
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '151',
    'Yawson Asante',
    58,
    'Male',
    '',
    '2025-06-03',
    '16:00:00',
    'VIP',
    'DISCHARGED',
    '2025-09-19',
    109,
    'Opanyin Yeboah',
    '547163139',
    350.0,
    50.0,
    2180.0,
    2180.0,
    4760.0,
    0.0,
    4760.0,
    '155.0',
    '202.0'
  );

  -- Record 152: Felix Kwadwo Ampofo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '152',
    'Felix Kwadwo Ampofo',
    80,
    'Male',
    '',
    '2025-06-05',
    '13:13:00',
    'VIP',
    'DISCHARGED',
    '2025-11-28',
    177,
    'Eric Ampofo',
    '244736149',
    350.0,
    50.0,
    3340.0,
    3540.0,
    7280.0,
    0.0,
    7280.0,
    '156.0',
    '108.0'
  );

  -- Record 153: Yaa Asuma
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '153',
    'Yaa Asuma',
    90,
    'Male',
    '',
    '2025-06-06',
    '10:30:00',
    'Normal',
    'DISCHARGED',
    '2025-10-03',
    120,
    'Felix Asante',
    '242115652',
    350.0,
    50.0,
    1560.0,
    1560.0,
    3520.0,
    0.0,
    3520.0,
    '157.0',
    '207.0'
  );

  -- Record 154: Dickson Kwame
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '154',
    'Dickson Kwame',
    80,
    'Male',
    '',
    '2025-06-07',
    '07:00:00',
    'Normal',
    'DISCHARGED',
    '2025-10-29',
    145,
    'Isaac Boafo',
    '548459710',
    350.0,
    50.0,
    1885.0,
    1885.0,
    4170.0,
    0.0,
    4170.0,
    '158.0',
    '226.0'
  );

  -- Record 155: Adwoa Darkwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '155',
    'Adwoa Darkwaa',
    41,
    'Female',
    '',
    '2025-06-09',
    '17:30:00',
    'Normal',
    'DISCHARGED',
    '2025-08-29',
    82,
    'Nicholas Bosompem',
    '244256288',
    350.0,
    50.0,
    1066.0,
    1066.0,
    2532.0,
    0.0,
    2532.0,
    '159.0',
    '192.0'
  );

  -- Record 156: Nelson Kwasi Nartey
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '156',
    'Nelson Kwasi Nartey',
    70,
    'Male',
    '',
    '2025-06-10',
    '00:00:00',
    'Normal',
    'DISCHARGED',
    '2025-10-24',
    137,
    'Michael Tetteh',
    '245765663',
    350.0,
    50.0,
    1781.0,
    1781.0,
    3962.0,
    0.0,
    3962.0,
    '160.0',
    '225.0'
  );

  -- Record 157: Yaw Oppong
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '157',
    'Yaw Oppong',
    90,
    'Male',
    '',
    '2025-06-10',
    '12:45:00',
    'Normal',
    'DISCHARGED',
    '2025-08-29',
    81,
    'Joyce Ofosuaa',
    '240937182',
    350.0,
    50.0,
    1053.0,
    1053.0,
    2506.0,
    0.0,
    2506.0,
    '161.0',
    '197.0'
  );

  -- Record 158: Dora Afrah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '158',
    'Dora Afrah',
    55,
    'Female',
    '',
    '2025-06-12',
    '19:15:00',
    'Normal',
    'DISCHARGED',
    '2025-10-31',
    142,
    'Kwaku Appiah',
    '248113292',
    350.0,
    50.0,
    1846.0,
    1846.0,
    4092.0,
    0.0,
    4092.0,
    '162.0',
    '243.0'
  );

  -- Record 159: Alice Asaah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '159',
    'Alice Asaah',
    87,
    'Female',
    '',
    '2025-06-14',
    '13:40:00',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Asare Bediako',
    '242122292',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '163.0',
    ''
  );

  -- Record 160: Patience Oforiwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '160',
    'Patience Oforiwaa',
    50,
    'Female',
    '',
    '2025-06-16',
    '11:00:00',
    'VIP',
    'DISCHARGED',
    '2025-08-29',
    75,
    'Seth Kobea',
    '248632476',
    350.0,
    50.0,
    1500.0,
    1500.0,
    3400.0,
    0.0,
    3400.0,
    '164.0',
    '193.0'
  );

  -- Record 161: Man Togo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '161',
    'Man Togo',
    74,
    'Male',
    '',
    '2025-06-19',
    '08:30:00',
    'Normal',
    'DISCHARGED',
    '2025-07-26',
    38,
    'Kwame Akoto',
    '257082636',
    350.0,
    50.0,
    494.0,
    494.0,
    1388.0,
    0.0,
    1388.0,
    '165.0',
    '173.0'
  );

  -- Record 162: Doris Ohenewaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '162',
    'Doris Ohenewaa',
    60,
    'Female',
    '',
    '2025-06-19',
    '10:30:00',
    'Normal',
    'DISCHARGED',
    '2025-10-03',
    107,
    'Seth Okyere',
    '248145638',
    350.0,
    50.0,
    1391.0,
    1391.0,
    3182.0,
    0.0,
    3182.0,
    '166.0',
    '205.0'
  );

  -- Record 163: Daniel Kwame Marfo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '163',
    'Daniel Kwame Marfo',
    55,
    'Male',
    '',
    '2025-06-19',
    '12:40:00',
    'Normal',
    'DISCHARGED',
    '2025-06-24',
    6,
    'Foster Agyare',
    '594386555',
    350.0,
    50.0,
    78.0,
    78.0,
    556.0,
    0.0,
    556.0,
    '167.0',
    '160.0'
  );

  -- Record 164: Sophia Frimpong
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '164',
    'Sophia Frimpong',
    42,
    'Female',
    '',
    '2025-06-19',
    '14:30:00',
    'Normal',
    'DISCHARGED',
    '2025-07-04',
    16,
    'Richard Bentum',
    '508406180',
    350.0,
    50.0,
    208.0,
    208.0,
    816.0,
    0.0,
    816.0,
    '168.0',
    '174.0'
  );

  -- Record 165: Afi Tagbor
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '165',
    'Afi Tagbor',
    72,
    'Female',
    '',
    '2025-06-22',
    '13:00:00',
    'Normal',
    'DISCHARGED',
    '2025-10-31',
    132,
    'Ernest Avadzinu',
    '242364213',
    350.0,
    50.0,
    1612.0,
    1716.0,
    3728.0,
    0.0,
    3728.0,
    '169.0',
    '219.0'
  );

  -- Record 166: Rose Animah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '166',
    'Rose Animah',
    58,
    'Female',
    '',
    '2025-06-24',
    '17:30:00',
    'VIP',
    'DISCHARGED',
    '2025-10-03',
    102,
    'John Ofori',
    '',
    350.0,
    50.0,
    2040.0,
    2040.0,
    4480.0,
    0.0,
    4480.0,
    '170.0',
    '206.0'
  );

  -- Record 167: Sarah Attaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '167',
    'Sarah Attaa',
    97,
    'Female',
    '',
    '2025-06-25',
    '11:30:00',
    'Normal',
    'DISCHARGED',
    '2025-10-31',
    129,
    'Jones Brobbey',
    '',
    350.0,
    50.0,
    1677.0,
    1677.0,
    3754.0,
    0.0,
    3754.0,
    '171.0',
    '241.0'
  );

  -- Record 168: Samuel Akuako
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '168',
    'Samuel Akuako',
    82,
    'Male',
    '',
    '2025-06-25',
    '19:00:00',
    'Normal',
    'DISCHARGED',
    '2025-10-30',
    128,
    'Yaw Acheampong',
    '546675537',
    350.0,
    50.0,
    1664.0,
    1664.0,
    3728.0,
    0.0,
    3728.0,
    '172.0',
    '217.0'
  );

  -- Record 169: Daniel Opoku
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '169',
    'Daniel Opoku',
    50,
    'Male',
    '',
    '2025-06-29',
    '16:00:00',
    'Normal',
    'DISCHARGED',
    '2025-10-03',
    97,
    'Raymond Agyei',
    '550255518',
    350.0,
    50.0,
    1261.0,
    1261.0,
    2922.0,
    0.0,
    2922.0,
    '173.0',
    '211.0'
  );

  -- Record 170: Comfort Afrah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '170',
    'Comfort Afrah',
    70,
    'Female',
    '',
    '2025-06-28',
    '19:00:00',
    'Normal',
    'DISCHARGED',
    '2025-10-31',
    126,
    'Samuel Antwi',
    '247744664',
    350.0,
    50.0,
    1638.0,
    1638.0,
    3676.0,
    0.0,
    3676.0,
    '174.0',
    '235.0'
  );

  -- Record 171: Esther Serwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '171',
    'Esther Serwaa',
    70,
    'Female',
    '',
    '2025-06-30',
    '16:30:00',
    'VIP',
    'DISCHARGED',
    '2025-10-31',
    124,
    'Georgina Antwiwaa',
    '246802783',
    350.0,
    50.0,
    2480.0,
    2480.0,
    5360.0,
    0.0,
    5360.0,
    '175.0',
    '236.0'
  );

  -- Record 172: Patrick Tetteh
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '172',
    'Patrick Tetteh',
    41,
    'Male',
    '',
    '2025-07-01',
    '12:00:00',
    'Normal',
    'DISCHARGED',
    '2025-08-29',
    60,
    'Isaac Tetteh',
    '559942653',
    350.0,
    50.0,
    780.0,
    780.0,
    1960.0,
    0.0,
    1960.0,
    '176.0',
    '195.0'
  );

  -- Record 173: Grace Asiedua
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '173',
    'Grace Asiedua',
    90,
    'Female',
    '',
    '2025-07-09',
    '14:00:00',
    'Normal',
    'DISCHARGED',
    '2025-11-28',
    143,
    'Godfred Darkwah',
    '537961472',
    350.0,
    50.0,
    1759.0,
    1859.0,
    4018.0,
    0.0,
    4018.0,
    '177.0',
    '247.0'
  );

  -- Record 174: Alex Antwi Darko
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '174',
    'Alex Antwi Darko',
    78,
    'Male',
    '',
    '2025-07-11',
    '15:00:00',
    'Normal',
    'IN_CUSTODY',
    '2026-03-27',
    260,
    'Asare Bediako',
    '242122292',
    350.0,
    50.0,
    0.0,
    3380.0,
    3780.0,
    0.0,
    3780.0,
    '178.0',
    ''
  );

  -- Record 175: Akosua Beatrice
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '175',
    'Akosua Beatrice',
    53,
    'Female',
    '',
    '2025-07-13',
    '14:00:00',
    'Normal',
    'DISCHARGED',
    '2025-10-03',
    83,
    'David Boadi',
    '546500381',
    350.0,
    50.0,
    1079.0,
    1079.0,
    2558.0,
    0.0,
    2558.0,
    '179.0',
    '212.0'
  );

  -- Record 176: Kwadwo Darkwah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '176',
    'Kwadwo Darkwah',
    60,
    'Male',
    '',
    '2025-07-17',
    '17:16:00',
    'Normal',
    'DISCHARGED',
    '2025-10-03',
    79,
    'Kwabena Appiah',
    '535372585',
    350.0,
    50.0,
    1027.0,
    1027.0,
    2454.0,
    0.0,
    2454.0,
    '180.0',
    '215.0'
  );

  -- Record 177: Deborah Otenewaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '177',
    'Deborah Otenewaa',
    47,
    'Female',
    '',
    '2025-07-19',
    '08:00:00',
    'VIP',
    'DISCHARGED',
    '2025-10-03',
    77,
    'Kwame Nuamah',
    '243309054',
    350.0,
    50.0,
    1540.0,
    1540.0,
    3480.0,
    0.0,
    3480.0,
    '181.0',
    '214.0'
  );

  -- Record 178: Godwin Adamtey
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '178',
    'Godwin Adamtey',
    42,
    'Male',
    '',
    '2025-07-18',
    '23:20:00',
    'VIP',
    'DISCHARGED',
    '2025-09-19',
    64,
    'Emmanuel Onukpa',
    '240929810',
    350.0,
    50.0,
    1280.0,
    1280.0,
    2960.0,
    0.0,
    2960.0,
    '182.0',
    '200.0'
  );

  -- Record 179: Christopher Addo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '179',
    'Christopher Addo',
    31,
    'Male',
    '',
    '2025-07-20',
    '09:56:00',
    'Normal',
    'DISCHARGED',
    '2025-08-01',
    13,
    'Albert K. Tetteh',
    '242886362',
    350.0,
    50.0,
    169.0,
    169.0,
    738.0,
    0.0,
    738.0,
    '183.0',
    '177.0'
  );

  -- Record 180: Rita Antwi
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '180',
    'Rita Antwi',
    46,
    'Female',
    '',
    '2025-07-19',
    '18:00:00',
    'Normal',
    'DISCHARGED',
    '2025-10-31',
    105,
    'K. Donsh',
    '243672539',
    350.0,
    50.0,
    1365.0,
    1365.0,
    3130.0,
    0.0,
    3130.0,
    '184.0',
    '230.0'
  );

  -- Record 181: Kofi Alhassan
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '181',
    'Kofi Alhassan',
    45,
    'Male',
    '',
    '2025-07-22',
    '08:17:00',
    'VIP',
    'DISCHARGED',
    '2025-10-24',
    95,
    'Okyere Yusif',
    '559213457',
    350.0,
    50.0,
    1900.0,
    1900.0,
    4200.0,
    0.0,
    4200.0,
    '185.0',
    '221.0'
  );

  -- Record 182: Francis Owusu
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '182',
    'Francis Owusu',
    35,
    'Female',
    '',
    '2025-07-23',
    '16:42:00',
    'VIP',
    'DISCHARGED',
    '2025-08-29',
    38,
    'Ebenezer Odoi Lartey',
    '201669517',
    350.0,
    50.0,
    760.0,
    760.0,
    1920.0,
    0.0,
    1920.0,
    '186.0',
    '188.0'
  );

  -- Record 183: Joseph Antiri Ofori-Atta
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '183',
    'Joseph Antiri Ofori-Atta',
    54,
    'Male',
    '',
    '2025-07-29',
    '09:43:00',
    'VIP',
    'DISCHARGED',
    '2025-10-24',
    88,
    'Michael Antiri Adisi',
    '541911615',
    350.0,
    50.0,
    1760.0,
    1760.0,
    3920.0,
    0.0,
    3920.0,
    '187.0',
    '228.0'
  );

  -- Record 184: Ama Adukpo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '184',
    'Ama Adukpo',
    90,
    'Female',
    '',
    '2025-07-30',
    '22:30:00',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Kwaku Adjakpa',
    '240618158',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '188.0',
    ''
  );

  -- Record 185: Emmanuel Essel
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '185',
    'Emmanuel Essel',
    25,
    'Male',
    '',
    '2025-08-04',
    '20:20:00',
    'Normal',
    'DISCHARGED',
    '2025-09-12',
    40,
    'Kwame Oduro',
    '536038692',
    350.0,
    50.0,
    520.0,
    520.0,
    1440.0,
    0.0,
    1440.0,
    '189.0',
    '199.0'
  );

  -- Record 186: Dickson Amedzo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '186',
    'Dickson Amedzo',
    51,
    'Male',
    '',
    '2025-08-05',
    '21:30:00',
    'VIP',
    'DISCHARGED',
    '2025-11-28',
    116,
    'Samuel K. Nyavi',
    '248104541',
    350.0,
    50.0,
    2120.0,
    2320.0,
    4840.0,
    0.0,
    4840.0,
    '190.0',
    '118.0'
  );

  -- Record 187: Alex Kofi Darkwah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '187',
    'Alex Kofi Darkwah',
    69,
    'Male',
    '',
    '2025-08-06',
    '14:20:00',
    'Normal',
    'DISCHARGED',
    '2025-11-28',
    115,
    'Yaw Osarfo',
    '243917189',
    350.0,
    50.0,
    1395.0,
    1495.0,
    3290.0,
    0.0,
    3290.0,
    '191.0',
    '116.0'
  );

  -- Record 188: Alexander Brobbey
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '188',
    'Alexander Brobbey',
    78,
    'Male',
    '',
    '2025-08-08',
    '12:00:00',
    'Normal',
    'DISCHARGED',
    '2025-10-03',
    57,
    'Christina Asantewaa',
    '535769827',
    350.0,
    50.0,
    741.0,
    741.0,
    1882.0,
    0.0,
    1882.0,
    '192.0',
    '216.0'
  );

  -- Record 189: Dora Darkwaah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '189',
    'Dora Darkwaah',
    46,
    'Female',
    '',
    '2025-08-09',
    '16:30:00',
    'VIP',
    'DISCHARGED',
    '2025-10-31',
    84,
    'Nti Botwe',
    '0556137887',
    350.0,
    50.0,
    840.0,
    1680.0,
    2920.0,
    0.0,
    2920.0,
    '193.0',
    '227.0'
  );

  -- Record 190: Kofi Ametekpe
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '190',
    'Kofi Ametekpe',
    98,
    'Male',
    '',
    '2025-08-13',
    '08:10:00',
    'Normal',
    'DISCHARGED',
    '2025-09-19',
    38,
    'Samson Wiekpo',
    '536960022',
    350.0,
    50.0,
    494.0,
    494.0,
    1388.0,
    0.0,
    1388.0,
    '194.0',
    '201.0'
  );

  -- Record 191: Margaret Nyankson
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '191',
    'Margaret Nyankson',
    65,
    'Female',
    '',
    '2025-08-13',
    '22:00:00',
    'Normal',
    'IN_CUSTODY',
    '2026-02-27',
    199,
    'Ebenezer Addo',
    '548315782',
    350.0,
    50.0,
    0.0,
    2587.0,
    2987.0,
    0.0,
    2987.0,
    '195.0',
    ''
  );

  -- Record 192: Kwasi Nimako
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '192',
    'Kwasi Nimako',
    69,
    'Male',
    '',
    '2025-08-14',
    '01:30:00',
    'VIP',
    'DISCHARGED',
    '2025-11-28',
    107,
    'Yeboah Adade',
    '245958269',
    350.0,
    50.0,
    2040.0,
    2140.0,
    4580.0,
    0.0,
    4580.0,
    '196.0',
    '101.0'
  );

  -- Record 193: Matilda Obenewaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '193',
    'Matilda Obenewaa',
    58,
    'Female',
    '',
    '2025-08-15',
    '09:00:00',
    'VIP',
    'IN_CUSTODY',
    '2026-02-27',
    197,
    'Enoch Owusu',
    '241413028',
    350.0,
    50.0,
    1000.0,
    3940.0,
    5340.0,
    0.0,
    5340.0,
    '197.0',
    ''
  );

  -- Record 194: Kwame Yeboah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '194',
    'Kwame Yeboah',
    80,
    'Male',
    '',
    '2025-08-18',
    '21:00:00',
    'VIP',
    'DISCHARGED',
    '2025-10-31',
    75,
    'Seth Frimpong',
    '599135006',
    350.0,
    50.0,
    1500.0,
    1500.0,
    3400.0,
    0.0,
    3400.0,
    '198.0',
    '238.0'
  );

  -- Record 195: Isaac Kwabena Bosompem
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '195',
    'Isaac Kwabena Bosompem',
    55,
    'Male',
    '',
    '2025-08-23',
    '14:30:00',
    'Normal',
    'DISCHARGED',
    '2025-10-03',
    42,
    'Emmanuel Frimpong',
    '',
    350.0,
    50.0,
    546.0,
    546.0,
    1492.0,
    0.0,
    1492.0,
    '199.0',
    '213.0'
  );

  -- Record 196: Beatrice Akosua Antwiwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '196',
    'Beatrice Akosua Antwiwaa',
    32,
    'Female',
    '',
    '2025-08-24',
    '22:00:00',
    'Normal',
    'DISCHARGED',
    '2025-11-28',
    97,
    'Martin Peprah',
    '547716620',
    350.0,
    50.0,
    1161.0,
    1261.0,
    2822.0,
    0.0,
    2822.0,
    '200.0',
    '107.0'
  );

  -- Record 197: Kofi Darkwah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '197',
    'Kofi Darkwah',
    67,
    'Male',
    '',
    '2025-08-26',
    '10:50:00',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Isaac Obeng',
    '540702449',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '201.0',
    ''
  );

  -- Record 198: Adwoa Kwakyewaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '198',
    'Adwoa Kwakyewaa',
    73,
    'Female',
    '',
    '2025-08-26',
    '10:50:00',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Kwame Gyapong',
    '248603401',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '202.0',
    ''
  );

  -- Record 199: Attah Ahorku
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '199',
    'Attah Ahorku',
    69,
    'Male',
    '',
    '2025-08-28',
    '20:30:00',
    'Normal',
    'DISCHARGED',
    '2025-11-28',
    93,
    'Joyce Sarpeh',
    '540451151',
    350.0,
    50.0,
    1109.0,
    1209.0,
    2718.0,
    0.0,
    2718.0,
    '203.0',
    '113.0'
  );

  -- Record 200: Comfort Inkum
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '200',
    'Comfort Inkum',
    87,
    'Female',
    '',
    '2025-08-30',
    '00:00:00',
    'VIP',
    'IN_CUSTODY',
    NULL,
    0,
    'Opanyin Kwaku Mensah',
    '591038895',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '205.0',
    ''
  );

  -- Record 201: Kennedy Ampaw
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '201',
    'Kennedy Ampaw',
    78,
    'Male',
    '',
    '2025-09-01',
    '14:30:00',
    'VIP',
    'DISCHARGED',
    '2025-11-28',
    89,
    'Harrison Amponsah',
    '553660455',
    350.0,
    50.0,
    1680.0,
    1780.0,
    3860.0,
    0.0,
    3860.0,
    '206.0',
    '103.0'
  );

  -- Record 202: Emmanuel Tsati
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '202',
    'Emmanuel Tsati',
    57,
    'Male',
    '',
    '2025-09-02',
    '10:45:00',
    'Normal',
    'DISCHARGED',
    '2025-11-28',
    88,
    'Daniel Tetteh',
    '0549548828',
    350.0,
    50.0,
    1144.0,
    1144.0,
    2688.0,
    0.0,
    2688.0,
    '207.0',
    '250.0'
  );

  -- Record 203: Alex Twumasi
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '203',
    'Alex Twumasi',
    60,
    'Male',
    '',
    '2025-09-03',
    '04:25:00 AM',
    'Normal',
    'DISCHARGED',
    '2025-10-24',
    52,
    'Kwaku Adjei',
    '0244597742',
    350.0,
    50.0,
    676.0,
    676.0,
    1752.0,
    0.0,
    1752.0,
    '208.0',
    '220.0'
  );

  -- Record 204: Amos Martey
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '204',
    'Amos Martey',
    87,
    'Male',
    '',
    '2025-09-04',
    '05:12:00 AM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Samuel kofi Ahua',
    '0243882578',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '209.0',
    ''
  );

  -- Record 205: Comfort Bruwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '205',
    'Comfort Bruwaa',
    87,
    'Female',
    '',
    '2025-09-05',
    '08:00:00 PM',
    'VIP',
    'IN_CUSTODY',
    '2026-03-27',
    204,
    'Martin Ankomah Oduro',
    '0552625629',
    350.0,
    50.0,
    3000.0,
    4080.0,
    7480.0,
    0.0,
    7480.0,
    '210.0',
    ''
  );

  -- Record 206: Kofi Oduro
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '206',
    'Kofi Oduro',
    47,
    'Male',
    '',
    '2025-09-08',
    '17:47:00',
    'Normal',
    'DISCHARGED',
    '2025-10-03',
    26,
    'E. K. Boahene',
    '0592085773',
    350.0,
    50.0,
    338.0,
    338.0,
    1076.0,
    0.0,
    1076.0,
    '211.0',
    '209.0'
  );

  -- Record 207: Dede Nartey
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '207',
    'Dede Nartey',
    64,
    'Female',
    '',
    '2025-09-10',
    '12:30:00 PM',
    'Normal',
    'DISCHARGED',
    '2025-11-28',
    80,
    'Fredrick T. Nartey',
    '0242944617',
    350.0,
    50.0,
    1040.0,
    1040.0,
    2480.0,
    0.0,
    2480.0,
    '212.0',
    '106.0'
  );

  -- Record 208: Hayford Mensah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '208',
    'Hayford Mensah',
    59,
    'Male',
    '',
    '2025-09-11',
    '12:45:00 PM',
    'Normal',
    'DISCHARGED',
    '2025-10-31',
    51,
    'Kwasi Hansom',
    '0533955770',
    350.0,
    50.0,
    663.0,
    663.0,
    1726.0,
    0.0,
    1726.0,
    '213.0',
    '239.0'
  );

  -- Record 209: William Addo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '209',
    'William Addo',
    54,
    'Male',
    '',
    '2025-09-12',
    '09:10:00 AM',
    'Normal',
    'DISCHARGED',
    '2025-11-28',
    78,
    'Alex Addo',
    '0533814052',
    350.0,
    50.0,
    1014.0,
    1014.0,
    2428.0,
    0.0,
    2428.0,
    '214.0',
    '117.0'
  );

  -- Record 210: Ali Tetteh
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '210',
    'Ali Tetteh',
    40,
    'Male',
    '',
    '2025-09-14',
    '05:00:00 AM',
    'Normal',
    'DISCHARGED',
    '2025-11-28',
    76,
    'Jonathan Narh',
    '0240703240',
    350.0,
    50.0,
    988.0,
    988.0,
    2376.0,
    0.0,
    2376.0,
    '215.0',
    '112.0'
  );

  -- Record 211: Adama Sagno
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '211',
    'Adama Sagno',
    27,
    'Male',
    '',
    '2025-09-15',
    '10:20:00',
    'VIP',
    'DISCHARGED',
    '2025-09-20',
    6,
    'Dickson Kamboe',
    '0546174677',
    350.0,
    50.0,
    120.0,
    120.0,
    640.0,
    0.0,
    640.0,
    '216.0',
    '204.0'
  );

  -- Record 212: Tetteh Wayoe
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '212',
    'Tetteh Wayoe',
    93,
    'Male',
    '',
    '2025-09-23',
    '06:30:00 PM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'John Albert Tetteh',
    '0249640700',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '217.0',
    ''
  );

  -- Record 213: William Ofori
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '213',
    'William Ofori',
    43,
    'Male',
    '',
    '2025-09-25',
    '09:10:00 AM',
    'Normal',
    'DISCHARGED',
    '2025-10-31',
    37,
    'Kwasi Ofori',
    '0241964760',
    350.0,
    50.0,
    481.0,
    481.0,
    1362.0,
    0.0,
    1362.0,
    '218.0',
    '244.0'
  );

  -- Record 214: Enock Brafo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '214',
    'Enock Brafo',
    38,
    'Male',
    '',
    '2025-09-25',
    '01:20:00 PM',
    'Normal',
    'DISCHARGED',
    '2025-12-07',
    74,
    'Eric Obuobi',
    '0544885661',
    350.0,
    50.0,
    962.0,
    962.0,
    2324.0,
    0.0,
    2324.0,
    '219.0',
    '120.0'
  );

  -- Record 215: Yaw Peprah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '215',
    'Yaw Peprah',
    75,
    'Male',
    '',
    '2025-09-27',
    '08:00:00 AM',
    'Normal',
    'IN_CUSTODY',
    '2026-03-27',
    182,
    'Adansi Pipim',
    '0242671859',
    350.0,
    50.0,
    0.0,
    2366.0,
    2766.0,
    0.0,
    2766.0,
    '220.0',
    ''
  );

  -- Record 216: Paul Brako
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '216',
    'Paul Brako',
    57,
    'Male',
    '',
    '2025-10-02',
    '12:40:00 PM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Samuel Yamoah',
    '0256698697',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '221.0',
    ''
  );

  -- Record 217: Comfort Apenteng
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '217',
    'Comfort Apenteng',
    70,
    'Female',
    '',
    '2025-10-05',
    '04:00:00 PM',
    'VIP',
    'IN_CUSTODY',
    '2026-04-24',
    202,
    'Owusu Agyei',
    '0246848492',
    350.0,
    50.0,
    0.0,
    4040.0,
    4440.0,
    0.0,
    4440.0,
    '222.0',
    ''
  );

  -- Record 218: Georgina Korang
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '218',
    'Georgina Korang',
    55,
    'Female',
    '',
    '2025-10-03',
    '19:42:00',
    'Normal',
    'DISCHARGED',
    '2025-10-31',
    29,
    'Isaac Ofori',
    '0537667291',
    350.0,
    50.0,
    377.0,
    377.0,
    1154.0,
    0.0,
    1154.0,
    '223.0',
    '232.0'
  );

  -- Record 219: Juliana Odurowaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '219',
    'Juliana Odurowaa',
    70,
    'Female',
    '',
    '2025-10-07',
    '08:30:00 AM',
    'VIP',
    'IN_CUSTODY',
    '2026-03-27',
    172,
    'Samuel Darkwah',
    '0540822333',
    350.0,
    50.0,
    0.0,
    3440.0,
    3840.0,
    0.0,
    3840.0,
    '224.0',
    ''
  );

  -- Record 220: Adwoa Owusua
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '220',
    'Adwoa Owusua',
    30,
    'Female',
    '',
    '2025-10-10',
    '06:24:00 PM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Kofi Ankrah',
    '0242323886',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '225.0',
    ''
  );

  -- Record 221: Philipa Aryeetey
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '221',
    'Philipa Aryeetey',
    17,
    'Female',
    '',
    '2025-10-12',
    '01:00:00 AM',
    'VIP',
    'IN_CUSTODY',
    NULL,
    0,
    'Emmanuel Doku',
    '0595110746',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '226.0',
    ''
  );

  -- Record 222: Emmanuel Osei
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '222',
    'Emmanuel Osei',
    68,
    'Male',
    '',
    '2025-10-15',
    '02:50:00 AM',
    'Normal',
    'IN_CUSTODY',
    '2026-03-27',
    164,
    'Isaac Kyei',
    '0246434239',
    350.0,
    50.0,
    1800.0,
    2132.0,
    4332.0,
    0.0,
    4332.0,
    '227.0',
    ''
  );

  -- Record 223: Ama Cynthia
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '223',
    'Ama Cynthia',
    42,
    'Female',
    '',
    '2025-10-14',
    '07:30:00 PM',
    'Normal',
    'DISCHARGED',
    '2025-11-28',
    46,
    'Benjamin Amoakwa',
    '0244660293',
    350.0,
    50.0,
    598.0,
    598.0,
    1596.0,
    0.0,
    1596.0,
    '228.0',
    '101.0'
  );

  -- Record 224: Nicholas Kwadwo Yeboah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '224',
    'Nicholas Kwadwo Yeboah',
    77,
    'Male',
    '',
    '2025-10-15',
    '18:30:00',
    'Normal',
    'IN_CUSTODY',
    '2026-02-27',
    136,
    'Kwadwo Ntiamoah',
    '0542837960',
    350.0,
    50.0,
    0.0,
    1768.0,
    2168.0,
    0.0,
    2168.0,
    '229.0',
    ''
  );

  -- Record 225: Samuel Kikisi
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '225',
    'Samuel Kikisi',
    78,
    'Male',
    '',
    '2025-10-17',
    '12:00:00 PM',
    'Normal',
    'IN_CUSTODY',
    '2026-03-27',
    162,
    'Twum Ampofo',
    '0240889143',
    350.0,
    50.0,
    0.0,
    2106.0,
    2506.0,
    0.0,
    2506.0,
    '230.0',
    ''
  );

  -- Record 226: Godfred K. Ampabeng
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '226',
    'Godfred K. Ampabeng',
    62,
    'Male',
    '',
    '2025-10-18',
    '04:30:00 PM',
    'Normal',
    'DISCHARGED',
    '2025-11-28',
    42,
    'Opanyin Amagyei',
    '0557232009',
    350.0,
    50.0,
    546.0,
    546.0,
    1492.0,
    0.0,
    1492.0,
    '231.0',
    '102.0'
  );

  -- Record 227: Boadi Darkwah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '227',
    'Boadi Darkwah',
    35,
    'Male',
    '',
    '2025-10-17',
    '02:00:00 PM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Kwasi Badu',
    '0549640472',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '232.0',
    ''
  );

  -- Record 228: Esther Boaduaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '228',
    'Esther Boaduaa',
    60,
    'Female',
    '',
    '2025-10-20',
    '09:30:00 AM',
    'VIP',
    'IN_CUSTODY',
    NULL,
    0,
    'Nti Botwe',
    '0556137887',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '233.0',
    ''
  );

  -- Record 229: Kwaku Peprah Mireku
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '229',
    'Kwaku Peprah Mireku',
    77,
    'Male',
    '',
    '2025-10-20',
    '07:15:00 PM',
    'Normal',
    'IN_CUSTODY',
    '2026-03-27',
    159,
    'Kwadwo Frimpong',
    '245398248',
    350.0,
    50.0,
    0.0,
    2067.0,
    2467.0,
    0.0,
    2467.0,
    '234.0',
    ''
  );

  -- Record 230: Akua Botwe
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '230',
    'Akua Botwe',
    123,
    'Female',
    '',
    '2025-10-18',
    '16:30:00',
    'VIP',
    'DISCHARGED',
    '2025-10-29',
    12,
    'Yaw Nti',
    '0541452511',
    350.0,
    50.0,
    240.0,
    240.0,
    880.0,
    0.0,
    880.0,
    '235.0',
    '237.0'
  );

  -- Record 231: Kwabena Appiah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '231',
    'Kwabena Appiah',
    48,
    'Male',
    '',
    '2025-10-21',
    '02:15:00 PM',
    'Normal',
    'DISCHARGED',
    '2025-10-24',
    4,
    'Samuel Darkwah',
    '0243164231',
    350.0,
    50.0,
    52.0,
    52.0,
    504.0,
    0.0,
    504.0,
    '236.0',
    '223.0'
  );

  -- Record 232: Abdul Razak Sulemana
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '232',
    'Abdul Razak Sulemana',
    46,
    'Male',
    '',
    '2025-10-22',
    '09:00:00 PM',
    'VIP',
    'DISCHARGED',
    '2025-10-23',
    2,
    'Awudu Mahama',
    '0249342673',
    350.0,
    50.0,
    20.0,
    40.0,
    460.0,
    0.0,
    460.0,
    '237.0',
    '224.0'
  );

  -- Record 233: Bernard Asamoah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '233',
    'Bernard Asamoah',
    39,
    'Male',
    '',
    '2025-10-23',
    '02:00:00 PM',
    'Normal',
    'DISCHARGED',
    '2025-11-28',
    37,
    'Kwasi Foster',
    '0247628807',
    350.0,
    50.0,
    481.0,
    481.0,
    1362.0,
    0.0,
    1362.0,
    '238.0',
    '114.0'
  );

  -- Record 234: Ama Obenewaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '234',
    'Ama Obenewaa',
    67,
    'Female',
    '',
    '2025-10-27',
    '12:45:00 PM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Samuel Yamoah',
    '0256698697',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '239.0',
    ''
  );

  -- Record 235: Janet Aboagyewaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '235',
    'Janet Aboagyewaa',
    90,
    'Female',
    '',
    '2025-10-29',
    '08:00:00 PM',
    'Normal',
    'IN_CUSTODY',
    '2026-03-27',
    150,
    'Kwame Atuah',
    '0554620203',
    350.0,
    50.0,
    0.0,
    1950.0,
    2350.0,
    0.0,
    2350.0,
    '240.0',
    ''
  );

  -- Record 236: Ernestina Asieduaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '236',
    'Ernestina Asieduaa',
    64,
    'Female',
    '',
    '2025-10-30',
    '03:30:00 PM',
    'Normal',
    'IN_CUSTODY',
    '2026-03-27',
    149,
    'Kofi Boadu',
    '0241868763',
    350.0,
    50.0,
    500.0,
    1937.0,
    2837.0,
    0.0,
    2837.0,
    '241.0',
    ''
  );

  -- Record 237: Goyen Appam
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '237',
    'Goyen Appam',
    52,
    'Female',
    '',
    '2025-10-30',
    '04:30:00 PM',
    'Normal',
    'DISCHARGED',
    '2025-11-28',
    30,
    'Kwame Appam',
    '0535800696',
    350.0,
    50.0,
    390.0,
    390.0,
    1180.0,
    0.0,
    1180.0,
    '242.0',
    '109.0'
  );

  -- Record 238: Kwadwo Addo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '238',
    'Kwadwo Addo',
    78,
    'Male',
    '',
    '2025-11-01',
    '06:45:00 AM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Kofi Owusu',
    '0242359012',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '243.0',
    ''
  );

  -- Record 239: Akosua Nyamekye
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '239',
    'Akosua Nyamekye',
    80,
    'Female',
    '',
    '2025-11-03',
    '08:00:00 AM',
    'Normal',
    'IN_CUSTODY',
    '2026-03-27',
    145,
    'Stephen Amaning',
    '055306675',
    350.0,
    50.0,
    0.0,
    1885.0,
    2285.0,
    0.0,
    2285.0,
    '244.0',
    ''
  );

  -- Record 240: Emmanuel Kuma Tagbor
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '240',
    'Emmanuel Kuma Tagbor',
    90,
    'Male',
    '',
    '2025-11-03',
    '01:00:00 PM',
    'VIP',
    'IN_CUSTODY',
    NULL,
    0,
    'Peter Tagbor',
    '0243132787',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '245.0',
    ''
  );

  -- Record 241: Solo Gadzi Atikpoe
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '241',
    'Solo Gadzi Atikpoe',
    51,
    'Male',
    '',
    '2025-11-02',
    '08:00:00 AM',
    'Normal',
    'DISCHARGED',
    '2025-11-29',
    28,
    'Samuel Agbeko',
    '0542406115',
    350.0,
    50.0,
    364.0,
    364.0,
    1128.0,
    0.0,
    1128.0,
    '246.0',
    '111.0'
  );

  -- Record 242: Isaac Kwadwo Agyei
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '242',
    'Isaac Kwadwo Agyei',
    29,
    'Male',
    '',
    '2025-11-03',
    '04:10:00 PM',
    'Normal',
    'DISCHARGED',
    '2025-12-04',
    32,
    'Emmanuel Akpandja',
    '0555966460',
    350.0,
    50.0,
    416.0,
    416.0,
    1232.0,
    0.0,
    1232.0,
    '247.0',
    '119.0'
  );

  -- Record 243: Dina Appiah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '243',
    'Dina Appiah',
    68,
    'Female',
    '',
    '2025-11-03',
    '05:15:00 PM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Martin Peprah',
    '0547716620',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '248.0',
    ''
  );

  -- Record 244: Solomon Nuadeke
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '244',
    'Solomon Nuadeke',
    62,
    'Male',
    '',
    '2025-11-07',
    '07:00:00 PM',
    'VIP',
    'IN_CUSTODY',
    '2026-02-27',
    113,
    'William Agbodeka',
    '0542518874',
    350.0,
    50.0,
    0.0,
    2260.0,
    2660.0,
    0.0,
    2660.0,
    '249.0',
    ''
  );

  -- Record 245: Rosemond Amoako
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '245',
    'Rosemond Amoako',
    63,
    'Female',
    '',
    '2025-11-10',
    '12:30:00 PM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Hayford Amoako',
    '0594114353',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '250.0',
    ''
  );

  -- Record 246: Doris
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '246',
    'Doris',
    54,
    'Female',
    '',
    '2025-11-10',
    '16:10:00',
    'Normal',
    'DISCHARGED',
    '2025-11-16',
    7,
    'Francis Kwarteng',
    '248647626',
    350.0,
    50.0,
    91.0,
    91.0,
    582.0,
    0.0,
    582.0,
    '251.0',
    '245.0'
  );

  -- Record 247: Richmond Asamoah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '247',
    'Richmond Asamoah',
    62,
    'Male',
    '',
    '2025-11-11',
    '07:30:00 PM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Welbeck Adu Amankwah',
    '0555338725',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '252.0',
    ''
  );

  -- Record 248: Naomi Nuadeke
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '248',
    'Naomi Nuadeke',
    52,
    'Female',
    '',
    '2025-11-11',
    '03:00:00 PM',
    'Normal',
    'IN_CUSTODY',
    '2026-02-27',
    109,
    'William Agbodeka',
    '0542518874',
    350.0,
    50.0,
    0.0,
    1417.0,
    1817.0,
    0.0,
    1817.0,
    '253.0',
    ''
  );

  -- Record 249: Samuel Akwasi Acheampong
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '249',
    'Samuel Akwasi Acheampong',
    77,
    'Male',
    '',
    '2025-11-12',
    '09:30:00 PM',
    'Normal',
    'IN_CUSTODY',
    '2026-03-27',
    136,
    'Kwasi Foster',
    '0247628807',
    350.0,
    50.0,
    0.0,
    1768.0,
    2168.0,
    0.0,
    2168.0,
    '254.0',
    ''
  );

  -- Record 250: Kwabena Marfo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '250',
    'Kwabena Marfo',
    63,
    'Male',
    '',
    '2025-11-13',
    '02:50:00 PM',
    'VIP',
    'IN_CUSTODY',
    '2026-03-27',
    135,
    'Isaac Kyei',
    '0246434239',
    350.0,
    50.0,
    0.0,
    2700.0,
    3100.0,
    0.0,
    3100.0,
    '255.0',
    ''
  );

  -- Record 251: Gifty Ampofo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '251',
    'Gifty Ampofo',
    38,
    'Female',
    '',
    '2025-11-13',
    '07:00:00 PM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Kwame Michael',
    '0246906921',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '256.0',
    ''
  );

  -- Record 252: Regina Serwaa Ampofo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '252',
    'Regina Serwaa Ampofo',
    65,
    'Female',
    '',
    '2025-11-15',
    '12:30:00 PM',
    'Normal',
    'IN_CUSTODY',
    '2026-07-31',
    259,
    'Samuel Ofori Ampofo',
    '247404050',
    350.0,
    50.0,
    0.0,
    3367.0,
    3767.0,
    0.0,
    3767.0,
    '257.0',
    ''
  );

  -- Record 253: Aku Ankrah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '253',
    'Aku Ankrah',
    92,
    'Female',
    '',
    '2025-11-15',
    '09:00:00 AM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Felix Doku Nartey',
    '0209910278',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '258.0',
    ''
  );

  -- Record 254: Adu Kofi
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '254',
    'Adu Kofi',
    65,
    'Male',
    '',
    '2025-11-17',
    '09:30:00 PM',
    'Normal',
    'IN_CUSTODY',
    '2026-04-17',
    152,
    'Martin Peprah',
    '0534493597',
    350.0,
    50.0,
    0.0,
    1976.0,
    2376.0,
    0.0,
    2376.0,
    '259.0',
    ''
  );

  -- Record 255: Louis Yaw Doku
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '255',
    'Louis Yaw Doku',
    65,
    'Male',
    '',
    '2025-11-20',
    '07:30:00 PM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'George Ofori',
    '0245353185',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '260.0',
    ''
  );

  -- Record 256: Comfort Odentaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '256',
    'Comfort Odentaa',
    80,
    'Female',
    '',
    '2025-11-25',
    '19:30:00',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Emmanuel Antwi Boasiako',
    '0243078509',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '261.0',
    ''
  );

  -- Record 257: Veronica Aku Amedi
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '257',
    'Veronica Aku Amedi',
    101,
    'Female',
    '',
    '2025-11-26',
    '10:00:00 AM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Paul Sedjro',
    '0244090419/0244068413',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '262.0',
    ''
  );

  -- Record 258: Emmanuel Asante
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '258',
    'Emmanuel Asante',
    52,
    'Male',
    '',
    '2025-11-26',
    '11:22:00 AM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Yaw Bredu',
    '0545342455',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '263.0',
    ''
  );

  -- Record 259: Emmanuel Tettey
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '259',
    'Emmanuel Tettey',
    52,
    'Male',
    '',
    '2025-11-26',
    '11:30:00 PM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Francis Teye-Wayoe',
    '0242261180',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '264.0',
    ''
  );

  -- Record 260: Christina Affum
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '260',
    'Christina Affum',
    85,
    'Female',
    '',
    '2025-11-27',
    '11:30:00 PM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Julius Tetteh',
    '0246532145',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '265.0',
    ''
  );

  -- Record 261: Yaw Antwi
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '261',
    'Yaw Antwi',
    60,
    'Male',
    '',
    '2025-11-27',
    '07:40:00 PM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Esther Kyerewaa',
    '0241266301',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '266.0',
    ''
  );

  -- Record 262: Kwabena Abrokwah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '262',
    'Kwabena Abrokwah',
    80,
    'Male',
    '',
    '2025-12-02',
    '12:50:00 PM',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Joyce Akoto',
    '0551420196',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '267.0',
    ''
  );

  -- Record 263: Janet Ampofowaa Amponsah
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '263',
    'Janet Ampofowaa Amponsah',
    67,
    'Female',
    '',
    '2025-12-03',
    '01:45:00 PM',
    'VIP',
    'IN_CUSTODY',
    NULL,
    0,
    'Asiedu Ampong',
    '02444126977',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '268.0',
    ''
  );

  -- Record 264: Priana Odame
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '264',
    'Priana Odame',
    6,
    'Female',
    '',
    '2025-12-03',
    '20:30:00',
    'Normal',
    'DISCHARGED',
    '2025-12-06',
    4,
    'Ernest Gyamfi',
    '550985768',
    350.0,
    50.0,
    52.0,
    52.0,
    504.0,
    0.0,
    504.0,
    '269.0',
    '121.0'
  );

  -- Record 265: Celestial Awuku Nyarko
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '265',
    'Celestial Awuku Nyarko',
    70,
    'Female',
    '',
    '2025-12-05',
    '09:30:00',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Divine Antwi',
    '242512984',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '270.0',
    ''
  );

  -- Record 266: Regina Brakoaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '266',
    'Regina Brakoaa',
    65,
    'Female',
    '',
    '2025-12-05',
    '10:00:00',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Patrick Owusu Agyei',
    '248131246',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '271.0',
    ''
  );

  -- Record 267: Maxwell Owusu
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '267',
    'Maxwell Owusu',
    39,
    'Male',
    '',
    '2025-12-08',
    '08:20:00',
    'VIP',
    'IN_CUSTODY',
    NULL,
    0,
    'Kwame Atuah',
    '554620203',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '272.0',
    ''
  );

  -- Record 268: Kwabena Sakyiama
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '268',
    'Kwabena Sakyiama',
    45,
    'Male',
    '',
    '2025-12-06',
    '06:30:00',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Ferguson Ohene',
    '549685856',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '273.0',
    ''
  );

  -- Record 269: Akua Oforiwaa Anane
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '269',
    'Akua Oforiwaa Anane',
    35,
    'Female',
    '',
    '2025-12-08',
    '10:00:00',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Kwabena Oppong',
    '241372177',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '274.0',
    ''
  );

  -- Record 270: Esi Agyarkwaa
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '270',
    'Esi Agyarkwaa',
    62,
    'Female',
    '',
    '2025-12-11',
    '19:30:00',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Job Brobbey',
    '540042991',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '275.0',
    ''
  );

  -- Record 271: Mary Afia Akakpo
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '271',
    'Mary Afia Akakpo',
    36,
    'Female',
    '',
    '2025-12-13',
    '03:00:00',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Samuel Akakpo',
    '241385818',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '276.0',
    ''
  );

  -- Record 272: Nana Larjder Kabutey
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '272',
    'Nana Larjder Kabutey',
    75,
    'Female',
    '',
    '2025-12-15',
    '11:10:00',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Rosina Asiedua',
    '541089136',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '277.0',
    ''
  );

  -- Record 273: Thomas Frimpong
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '273',
    'Thomas Frimpong',
    64,
    'Male',
    '',
    '2025-12-19',
    '19:30:00',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Yaw Kra',
    '241455337',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '278.0',
    ''
  );

  -- Record 274: Tetteh Kwabena
  INSERT INTO deceased_cases (
    branch_id, tag_no, name_of_deceased, age, gender,
    place, admission_date, admission_time, type, status,
    discharge_date, storage_days, relative_name, relative_contact,
    registration_fee, embalming_fee, coldroom_fee, storage_fee,
    total_bill, total_paid, balance,
    embalming_receipt_no, coldroom_receipt_no
  ) VALUES (
    v_branch_id,
    '274',
    'Tetteh Kwabena',
    52,
    'Male',
    '',
    '2025-12-24',
    '19:30:00',
    'Normal',
    'IN_CUSTODY',
    NULL,
    0,
    'Richmond Frimpong',
    '541116410',
    350.0,
    50.0,
    0.0,
    0.0,
    400.0,
    0.0,
    400.0,
    '279.0',
    ''
  );

  RAISE NOTICE 'Import complete! Inserted % records.', 274;
END $$;

-- Verify import
SELECT COUNT(*) as total_records FROM deceased_cases WHERE branch_id = (
  SELECT id FROM branches WHERE name = 'Asuom Branch'
);

SELECT status, COUNT(*) as count FROM deceased_cases
WHERE branch_id = (SELECT id FROM branches WHERE name = 'Asuom Branch')
GROUP BY status;
