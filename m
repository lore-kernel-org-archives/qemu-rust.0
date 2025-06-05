Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uN7eX-0000Cr-KD
	for mharc-qemu-rust@gnu.org; Thu, 05 Jun 2025 06:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7e3-0007UN-7x
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7e1-0001MJ-LC
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749118581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GD5j4iIBSM/wWOplLwp2FFPFSX88IRGEIBS2r4z9frY=;
 b=KxNCwO02D0KUMLAC/rdY7py17vMxsMe3OBnc1lP1UTwaMAK7YHLVt+ZnnnfqQTvsc5UXIz
 AvFIvinbQthYNqK6eMh1cvnSbkBbzO7cptwBrmVKLTkG21H7zTyiF6Vh/Rz1/yz1Xocr8n
 rNmkLNevRBWl8ONsOW8WWmhRQtm7H2k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-ubl7pB6wPiaUJ-_SEYEOOQ-1; Thu, 05 Jun 2025 06:16:18 -0400
X-MC-Unique: ubl7pB6wPiaUJ-_SEYEOOQ-1
X-Mimecast-MFC-AGG-ID: ubl7pB6wPiaUJ-_SEYEOOQ_1749118577
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-450cb8f8b1bso1994375e9.3
 for <qemu-rust@nongnu.org>; Thu, 05 Jun 2025 03:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749118577; x=1749723377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GD5j4iIBSM/wWOplLwp2FFPFSX88IRGEIBS2r4z9frY=;
 b=D798sfD+670EwFzqgOPKQ/ItwVWxt01mQMBLeeiQMWoncA3UbKzP7NvbsyrKpuk4+/
 6R3jyhGcTUmjKUDpRPXzFVvbFnIicYIenCTtCH2mwS0nbx3EP34Nwnq94X0vIDD/wVRF
 U8umVdS1SOQQKFoKEMO7ewIzDmCOVgTVSImT3GfQN96pi2wn8HTjVQghBDZ72SOoSiZt
 niLKm+JnZtUnnq2Q6gX5kWv+uOq7/Tso2WrngFEjMLPfGVnxjqL1On3SKQlVscS3tECR
 ByqlD/2q/rz9X3cPN/EK2OrpzkXiD2YNGEyo81HeaVIkaR972xwwE3q7QZzOjVdG5yVg
 Ky9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXej54lfY8cg4xdP9/eq78YsN8qVGVJgUudQD+0cBY+lQBwHpoxFViawjUzWpt6YrlryxibnF5IsSM=@nongnu.org
X-Gm-Message-State: AOJu0YwjssBCVYtTpiRFsa6W2DdN70UXxBfU4fVy9ehKfM1L/SFl7dF3
 7HuQfMlymNWwL4XflTALO20dlcjYVbOfLYcECN1LGNrf1w0KD9dOlFlRjKCW/sd6wudptQvn4Tt
 2twsnxmQerRYlYCPagnPxW03M+D/qJxqNl2Mmd+fIDAr0YUffNSfvjpQ=
X-Gm-Gg: ASbGncsttph7tY6tcr4hXCzNG7HfOjg+/pPxS5t78bSb1TgSyInE/Gm+oIPKpIJr4FP
 ulmBwSqPLLSKndIBzlnEX3cATktJUrFbRedPTUCGT2zq5CzaltPfTM7xdbBdFiRqgZ2JBmT0Dgh
 2mBG9dfT8IGGf9s9y1qXgo1+dL594n/mRFdc4EFsxuNA9XLZh6exMGNIRwD+U/R/D6MJd2nX9wP
 3jPYOai2l6RpoAVNI+cXVya6dhF+FjbSXobcqZEt6LsWO68FH6AUkmqaV6W2kqZ0fhKLpvJKZxi
 0YzGi7cP7rbpQxumgcfvFPSm
X-Received: by 2002:a05:600c:8b6d:b0:450:cf46:5510 with SMTP id
 5b1f17b1804b1-451f0b22e23mr56626845e9.29.1749118576821; 
 Thu, 05 Jun 2025 03:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM0OyOQR1+NRguq1XOtcjnPQIF9Gr40UgvMJqdEGVs+VneypJ8IWVhahKwCGWB3BdJbkU2fA==
X-Received: by 2002:a05:600c:8b6d:b0:450:cf46:5510 with SMTP id
 5b1f17b1804b1-451f0b22e23mr56626545e9.29.1749118576346; 
 Thu, 05 Jun 2025 03:16:16 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00972c1sm24452174f8f.68.2025.06.05.03.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:16:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 12/14] rust/hpet: return errors from realize if properties are
 incorrect
Date: Thu,  5 Jun 2025 12:15:41 +0200
Message-ID: <20250605101544.368953-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605101544.368953-1-pbonzini@redhat.com>
References: <20250605101544.368953-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PeIJseNSPsNjGj_ymatEzi4T2v1AWMAon2rz6oJynts_1749118577
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 05 Jun 2025 10:16:23 -0000

Match the code in hpet.c; this also allows removing the
BqlCell from the num_timers field.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/device.rs | 16 +++++++---------
 rust/hw/timer/hpet/src/fw_cfg.rs |  7 +++----
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index a957de1e767..cd439f90b7e 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -725,18 +725,16 @@ fn post_init(&self) {
     }
 
     fn realize(&self) -> qemu_api::Result<()> {
+        if self.num_timers.get() < HPET_MIN_TIMERS || self.num_timers.get() > HPET_MAX_TIMERS {
+            Err(format!(
+                "hpet.num_timers must be between {HPET_MIN_TIMERS} and {HPET_MAX_TIMERS}"
+            ))?;
+        }
         if self.int_route_cap == 0 {
-            // TODO: Add error binding: warn_report()
-            println!("Hpet's hpet-intcap property not initialized");
+            Err("hpet.hpet-intcap property not initialized")?;
         }
 
-        self.hpet_id.set(HPETFwConfig::assign_hpet_id());
-
-        if self.num_timers.get() < HPET_MIN_TIMERS {
-            self.num_timers.set(HPET_MIN_TIMERS);
-        } else if self.num_timers.get() > HPET_MAX_TIMERS {
-            self.num_timers.set(HPET_MAX_TIMERS);
-        }
+        self.hpet_id.set(HPETFwConfig::assign_hpet_id()?);
 
         self.init_timer();
         // 64-bit General Capabilities and ID Register; LegacyReplacementRoute.
diff --git a/rust/hw/timer/hpet/src/fw_cfg.rs b/rust/hw/timer/hpet/src/fw_cfg.rs
index 6c10316104c..619d662ee1e 100644
--- a/rust/hw/timer/hpet/src/fw_cfg.rs
+++ b/rust/hw/timer/hpet/src/fw_cfg.rs
@@ -36,7 +36,7 @@ unsafe impl Zeroable for HPETFwConfig {}
 };
 
 impl HPETFwConfig {
-    pub(crate) fn assign_hpet_id() -> usize {
+    pub(crate) fn assign_hpet_id() -> Result<usize, &'static str> {
         assert!(bql_locked());
         // SAFETY: all accesses go through these methods, which guarantee
         // that the accesses are protected by the BQL.
@@ -48,13 +48,12 @@ pub(crate) fn assign_hpet_id() -> usize {
         }
 
         if fw_cfg.count == 8 {
-            // TODO: Add error binding: error_setg()
-            panic!("Only 8 instances of HPET is allowed");
+            Err("Only 8 instances of HPET are allowed")?;
         }
 
         let id: usize = fw_cfg.count.into();
         fw_cfg.count += 1;
-        id
+        Ok(id)
     }
 
     pub(crate) fn update_hpet_cfg(hpet_id: usize, timer_block_id: u32, address: u64) {
-- 
2.49.0


