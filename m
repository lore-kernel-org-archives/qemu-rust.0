Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uN7eV-000061-6k
	for mharc-qemu-rust@gnu.org; Thu, 05 Jun 2025 06:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7dw-0007RN-HA
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7dv-0001Kl-2H
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749118574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MfaojDveYu66HwFkWgBRf71Aj3k7FgV+E+U33pqpFC4=;
 b=bDoiAoSJJ7Z3y+kvLyfBIxV7mG3gRDvVhBKGcWJc1/+OMJR+Q2Rf0r5+I8uijIMyYuCFY1
 Zfu3YrQvEZUk3BJBAbgvY7rqzqgPeu6xUf7fUxzIa4cQ26hHdYVPW/Pomst0cvADcK74Gw
 TNySHzZXkGhrbknbOubzL5aANMhiB0I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-20zTInZGMCuz2DJVylfa8Q-1; Thu, 05 Jun 2025 06:16:13 -0400
X-MC-Unique: 20zTInZGMCuz2DJVylfa8Q-1
X-Mimecast-MFC-AGG-ID: 20zTInZGMCuz2DJVylfa8Q_1749118572
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4f65a705dso573984f8f.2
 for <qemu-rust@nongnu.org>; Thu, 05 Jun 2025 03:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749118572; x=1749723372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MfaojDveYu66HwFkWgBRf71Aj3k7FgV+E+U33pqpFC4=;
 b=WQF137n2wlVRlrIvdXLj2bJgxsi7w2T4XJUApsQCYjCNbD+JOTayHbYyALStFuW3vA
 Pg7cC6BktG+D7jfzmyi8q1JjWtFla2U/DtkeRTH+dXMhS/KEOPLq3nsBEbdfs7j5OD6y
 1uiZKjl4BTdvghJsL3J7ySGQ8jOcTLktbTdL7BB0hyJdvom1FU8Jb0C+mgFAI2WXgqqM
 WyH61fyDAAe8anH167V8hqL89+tfa4mRlqgfVu4GRAz90JnQzAPvV7bxFEEIulLWAruV
 kMLz5COiNWAwtIRopw/2QxGh8zIZxw5BIxdHBVqM/Bc5u+e3KpLlacd1ODKL6hRndtYh
 8wMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2Y/5JOF9bpguth1YfdIqAjujnnBd1GffzmpQZuxDxHj2PpPk4TTNdEjOGh0I7b7Epr54OPShy9us=@nongnu.org
X-Gm-Message-State: AOJu0YySZrBK7pL/tBpYIHRw/Khs69gV02YhI40PdbOQ7IA0yePzecBv
 KJlE1JzzE2sy0Pyg1mU63bELkBwge4e68eWx8NYfaQf6u5ViNP6O7k7zE58Y154vSVdk+9JdKPA
 VV2TTm0JArxvMwtdmkTJtuWOPnejhe9eO9CKAGqdCQpq8/R52/TJ+vLw=
X-Gm-Gg: ASbGncuO/bfL7GOa509MqsyiZnnOPeyAYOFOqxP27rpjXzqZ3bfjrvY1aJX1cjxCDp8
 tXPBtfPZ2SRpEeE7JTe0XkDsJGeznvsPxND9+jPla5tb8t6ZnxVcI018dpGM+L6y1X9hGIOq2iU
 5GckKW1j4OJv/Xi7ly+ZRhuOgU35h2clc87nGuT1bFy9cOevofaO7BALQ/Gji+o3Q87xTEf6JvR
 zYHBuTiTahUbm9yaPR/nVyp6LenzEXwR1ix3MvrALFby/kkwPGYRVcAe6va5XbqrZLjJn4Rlny2
 UJXtI1OdEBsEtw==
X-Received: by 2002:a5d:64e3:0:b0:3a4:dcb0:a4c with SMTP id
 ffacd0b85a97d-3a51d8ef83emr5433770f8f.12.1749118572114; 
 Thu, 05 Jun 2025 03:16:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHecX6UKB1pQHy8AQyvRee+1G6esV4U4Qrwt11W9elhthInTzfY2XNE11v1BWZApM5wfQB13A==
X-Received: by 2002:a5d:64e3:0:b0:3a4:dcb0:a4c with SMTP id
 ffacd0b85a97d-3a51d8ef83emr5433747f8f.12.1749118571725; 
 Thu, 05 Jun 2025 03:16:11 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe6ca08sm24927666f8f.33.2025.06.05.03.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:16:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 10/14] hpet: adjust VMState for consistency with Rust version
Date: Thu,  5 Jun 2025 12:15:39 +0200
Message-ID: <20250605101544.368953-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605101544.368953-1-pbonzini@redhat.com>
References: <20250605101544.368953-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9QJOPwnsTdOaaAqKMWv37iV8j4QaMigKwkNrMOu7Htk_1749118572
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jun 2025 10:16:19 -0000

No functional change intended.

Suggested-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/timer/hpet.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 0fd1337a156..9db027cf76f 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -328,16 +328,16 @@ static const VMStateDescription vmstate_hpet_timer = {
 static const VMStateDescription vmstate_hpet = {
     .name = "hpet",
     .version_id = 2,
-    .minimum_version_id = 1,
+    .minimum_version_id = 2,
     .pre_save = hpet_pre_save,
     .post_load = hpet_post_load,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT64(config, HPETState),
         VMSTATE_UINT64(isr, HPETState),
         VMSTATE_UINT64(hpet_counter, HPETState),
-        VMSTATE_UINT8_V(num_timers_save, HPETState, 2),
+        VMSTATE_UINT8(num_timers_save, HPETState),
         VMSTATE_VALIDATE("num_timers must match", hpet_validate_num_timers),
-        VMSTATE_STRUCT_VARRAY_UINT8(timer, HPETState, num_timers, 0,
+        VMSTATE_STRUCT_VARRAY_UINT8(timer, HPETState, num_timers_save, 0,
                                     vmstate_hpet_timer, HPETTimer),
         VMSTATE_END_OF_LIST()
     },
-- 
2.49.0


