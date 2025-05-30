Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uKuiU-0002cC-QY
	for mharc-qemu-rust@gnu.org; Fri, 30 May 2025 04:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKuiJ-0002Y5-SS
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKuiG-0004cy-68
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748592215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ElGaxLGiSIb6e5dqiWIlm8oesZYBfD74a0jBFqGIj5Q=;
 b=S1OQxJMI/mGAk75RulRxGFWJB4rsFWMI6G7eaFWXcWpoFk5mgvL5b//Galhp+PBiA4PdPF
 kY28/cAwJnhPhpI8v1y55QQGIbHHIBTP6tIYJdLeonNPXdaJqe0Gw2FSiQY/2+zFwIeHIe
 9tu08Ibdfp1TmYLXBvxyNS5AhBZ2jtc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-4g6g2YY8NRGB7SVyog8PCg-1; Fri, 30 May 2025 04:03:34 -0400
X-MC-Unique: 4g6g2YY8NRGB7SVyog8PCg-1
X-Mimecast-MFC-AGG-ID: 4g6g2YY8NRGB7SVyog8PCg_1748592213
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ad56c5412f2so153924966b.1
 for <qemu-rust@nongnu.org>; Fri, 30 May 2025 01:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748592212; x=1749197012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ElGaxLGiSIb6e5dqiWIlm8oesZYBfD74a0jBFqGIj5Q=;
 b=Sf/5ko8jIiagrzO7zk6FiHQrosSbBMOiaJZCHOGFqDNaIfBAiYi1S1HHrbAaQ5EJbE
 OgZ0+Ot+OjTBQfMMyfK02xuYgt0L4IeqvDE1xcIJdIA6+ObtaD7WbpVRJSRjb243ExAM
 /K6HdBx6z37Q/FOLXTjTPGkwQi1dwIofk0ds+/DcuQnITLmSJFBTInrLonVnZmSGq/lt
 53Hddr+hYRjJvzX0Jkx3cMAd0X8z8oMbU649+ezEsEBtp/K6RKYoBL5q7RuqZxEwmCVZ
 iYryO7rkmBqVpCjiUKTuoE2xjY8RKdxD5QgEuSLevBwYzYsvz8LIiltolYUs8MSENvx7
 wFvw==
X-Gm-Message-State: AOJu0YznUn9pcMI/laOWLnunWmr9c+J/j7a1/3MI94HJ6BLjInHCV2pA
 9CGosL4q0oornZDomFCTceLk9oAd7V5CXkLOuXEhEfivgXE5C+UmF1B2j2B3XlRQWPZVQe04C+e
 I/vjaBuWX1vHcOJYTb1RnIa57CCPaUtkuoEQUMv3tuT4S93TEC8zT+rhhKpd8n/c=
X-Gm-Gg: ASbGncsnkGGIvHO/IlB3B0FRr+Q+RjS7OaLsCP0VWKKnXB64TiS17wZ0VDKHuZLdO4H
 REet/9Bk0XPNpJpJOiXFW2VwYa9hMwyHgLBZ2G+83TMGw8lPaYpCvzLMZR5Qw5DTrVTCPE+Rraj
 p+YeF9t7UTBKkS4D4H86gaTkwoVHuD+kVHLflzREtYp0pPmXhRKaK1PaDXaxZVfNhqK4PDEeL0D
 73NwWBKhej6c3TfxoVDgM9GeMRhvjMwdpO87aIUjK7nw983RCLPlrAzqquKEmz5FQP5gAHyt+wG
 xwZ95nO1Ec5V63+V9AMT9W6N
X-Received: by 2002:a17:907:2dab:b0:ad5:a121:6ebc with SMTP id
 a640c23a62f3a-adb369a920emr115420166b.0.1748592211832; 
 Fri, 30 May 2025 01:03:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzlWwk+vNhNWbAmh9fEidfaKWhOYah4lEW53NzQosW8rlOvJbnHMfQ5hG1ycPNy1U7ojTbtg==
X-Received: by 2002:a17:907:2dab:b0:ad5:a121:6ebc with SMTP id
 a640c23a62f3a-adb369a920emr115414566b.0.1748592211359; 
 Fri, 30 May 2025 01:03:31 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d7fecc5sm287680966b.10.2025.05.30.01.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 01:03:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 09/14] rust/hpet: change type of num_timers to usize
Date: Fri, 30 May 2025 10:03:01 +0200
Message-ID: <20250530080307.2055502-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530080307.2055502-1-pbonzini@redhat.com>
References: <20250530080307.2055502-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vjXdB2Msdt3g6-frFMCPVK3RRc74fa-l7JZmdy9JXvU_1748592213
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.902,
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
X-List-Received-Date: Fri, 30 May 2025 08:03:43 -0000

Remove the need to convert after every read of the BqlCell.  Because the
vmstate uses a u8 as the size of the VARRAY, this requires switching
the VARRAY to use num_timers_save; which in turn requires ensuring that
the num_timers_save is always there.  For simplicity do this by
removing support for version 1, which QEMU has not been producing for
~15 years.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/device.rs | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 68c82b09b60..a957de1e767 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -12,7 +12,7 @@
 use qemu_api::{
     bindings::{
         address_space_memory, address_space_stl_le, qdev_prop_bit, qdev_prop_bool,
-        qdev_prop_uint32, qdev_prop_uint8,
+        qdev_prop_uint32, qdev_prop_usize,
     },
     cell::{BqlCell, BqlRefCell},
     irq::InterruptSource,
@@ -36,9 +36,9 @@
 const HPET_REG_SPACE_LEN: u64 = 0x400; // 1024 bytes
 
 /// Minimum recommended hardware implementation.
-const HPET_MIN_TIMERS: u8 = 3;
+const HPET_MIN_TIMERS: usize = 3;
 /// Maximum timers in each timer block.
-const HPET_MAX_TIMERS: u8 = 32;
+const HPET_MAX_TIMERS: usize = 32;
 
 /// Flags that HPETState.flags supports.
 const HPET_FLAG_MSI_SUPPORT_SHIFT: usize = 0;
@@ -561,8 +561,8 @@ pub struct HPETState {
 
     /// HPET timer array managed by this timer block.
     #[doc(alias = "timer")]
-    timers: [BqlRefCell<HPETTimer>; HPET_MAX_TIMERS as usize],
-    num_timers: BqlCell<u8>,
+    timers: [BqlRefCell<HPETTimer>; HPET_MAX_TIMERS],
+    num_timers: BqlCell<usize>,
     num_timers_save: BqlCell<u8>,
 
     /// Instance id (HPET timer block ID).
@@ -572,7 +572,7 @@ pub struct HPETState {
 impl HPETState {
     // Get num_timers with `usize` type, which is useful to play with array index.
     fn get_num_timers(&self) -> usize {
-        self.num_timers.get().into()
+        self.num_timers.get()
     }
 
     const fn has_msi_flag(&self) -> bool {
@@ -854,7 +854,7 @@ fn pre_save(&self) -> i32 {
          * also added to the migration stream.  Check that it matches the value
          * that was configured.
          */
-        self.num_timers_save.set(self.num_timers.get());
+        self.num_timers_save.set(self.num_timers.get() as u8);
         0
     }
 
@@ -884,7 +884,7 @@ fn is_offset_needed(&self) -> bool {
     }
 
     fn validate_num_timers(&self, _version_id: u8) -> bool {
-        self.num_timers.get() == self.num_timers_save.get()
+        self.num_timers.get() == self.num_timers_save.get().into()
     }
 }
 
@@ -911,7 +911,7 @@ impl ObjectImpl for HPETState {
         c"timers",
         HPETState,
         num_timers,
-        unsafe { &qdev_prop_uint8 },
+        unsafe { &qdev_prop_usize },
         u8,
         default = HPET_MIN_TIMERS
     ),
@@ -1016,16 +1016,16 @@ impl ObjectImpl for HPETState {
 static VMSTATE_HPET: VMStateDescription = VMStateDescription {
     name: c"hpet".as_ptr(),
     version_id: 2,
-    minimum_version_id: 1,
+    minimum_version_id: 2,
     pre_save: Some(hpet_pre_save),
     post_load: Some(hpet_post_load),
     fields: vmstate_fields! {
         vmstate_of!(HPETState, config),
         vmstate_of!(HPETState, int_status),
         vmstate_of!(HPETState, counter),
-        vmstate_of!(HPETState, num_timers_save).with_version_id(2),
+        vmstate_of!(HPETState, num_timers_save),
         vmstate_validate!(HPETState, VALIDATE_TIMERS_NAME, HPETState::validate_num_timers),
-        vmstate_struct!(HPETState, timers[0 .. num_timers], &VMSTATE_HPET_TIMER, BqlRefCell<HPETTimer>, HPETState::validate_num_timers).with_version_id(0),
+        vmstate_struct!(HPETState, timers[0 .. num_timers_save], &VMSTATE_HPET_TIMER, BqlRefCell<HPETTimer>, HPETState::validate_num_timers).with_version_id(0),
     },
     subsections: vmstate_subsections! {
         VMSTATE_HPET_RTC_IRQ_LEVEL,
-- 
2.49.0


