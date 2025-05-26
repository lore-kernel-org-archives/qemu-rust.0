Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJYlz-0003Qq-Pv
	for mharc-qemu-rust@gnu.org; Mon, 26 May 2025 10:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlg-00032J-Ud
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYld-0007sw-7m
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748269528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e7XL373PGEgSsSjnf8t+unv02/Oh406O0MVIcACVlRA=;
 b=eluJZ7DjBiw2s0QHh0SWbbuseTTTMcihA63Km0X5ZMRVhJ2jeagH9UdCFDT5D2dkVgcpa1
 OLXIzOQLXEBxnvUWEWM8JGFS621jjQARlh4GAxnoLTgW0/zw3mut89IZ3rytJy/mx0T5dS
 8+GAyT4SUPcKcHaQ+olW9bTxvcuZTIY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-TdV1c3BnOn28rgC6cQbf8w-1; Mon, 26 May 2025 10:25:27 -0400
X-MC-Unique: TdV1c3BnOn28rgC6cQbf8w-1
X-Mimecast-MFC-AGG-ID: TdV1c3BnOn28rgC6cQbf8w_1748269526
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d0830c3f7so18158985e9.2
 for <qemu-rust@nongnu.org>; Mon, 26 May 2025 07:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748269525; x=1748874325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e7XL373PGEgSsSjnf8t+unv02/Oh406O0MVIcACVlRA=;
 b=TdEF+O/u3ciKPgkG5Vf0q/6DCal3neOPGwnEL0v7IDwTAARYEBECdHf4RO2tFEhC3N
 EuKTLIaa6a8OT03StZuBuoPVIouAq5AGlLniQMn0CcnWiRGODx5NQX6po0q2R2d2/PN/
 V1KWTvRWah5/zIDYQbeaop69oaki74y41WBZ+MO89Jixl0vTTVyJebqV5Txwt9/W1WVn
 uVGcs+TNAwOZl1dZRL9EBnwFYLNh3gd2LVRplpowFCFtORUzQWxSzhdWJYqpAsTz/WdY
 OlOwlrHgcycovI0HcA+cSyEdiYwraHK4B9dj725gHlWMiPZlB280bEZNsmC/7yhCegGb
 ie3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEhB/4PImMPRctnUrEOK5xzLXKss3eT445rRWEKgzLvzhRcq+e3dcOki653+PXGtx/NDlFj5tTUWY=@nongnu.org
X-Gm-Message-State: AOJu0YzZYoghzPcMY0ri6uH26W7OzK3lvRjjAy+TWTYAk8dBGwZsPzAM
 +bgMcAYXLrVCZv5cHMXLuKHb5xo/lUIOUTBszs/eMN+FPeAlXAPV3Y1EfwRynLQyal4c0pizbQP
 B3xuVGMtrt0MIHi60cK7HL2aZXBCEasEoi1L+TJK8JbiYKq+Yo068uCi4rr8/tdI=
X-Gm-Gg: ASbGncu4rnGeaH3dhmLP1xlLyZ+zqvL04yLpDkhRfF2n2Hj9OYGv5F6E0AiIeZqgxS+
 0uPe3lQfm6Fvk3bI4bpRnur1Biwe6cyT8DnlPG4MTCyjl4dY2gtGzfS45RfScozVU3D1DhPPAT6
 6us0qZQ8m+oDepKaW5mNuJmrVs4oLJuYC6QDhOdJwJ/9KfPZ8yhwZ/8JlrZgJju2fK/3kIGUfGL
 8wpOjSAedlEcZKi3tqFkOzqy0qOSZOcADLAK21CVij6plKpveB4y9fiDNDE5Xm91I7vQ0+01KCo
 H2nURhjyPQPm6Q==
X-Received: by 2002:a05:600c:34ca:b0:441:b076:fce8 with SMTP id
 5b1f17b1804b1-44c91ad7026mr86946165e9.14.1748269525309; 
 Mon, 26 May 2025 07:25:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzoBz7wkVpIO4pdjuOW8qCuI7xCcvhjjqVOMYzJbqIs93+muKPKEJSTXNKX00Yti2oLT4ENw==
X-Received: by 2002:a05:600c:34ca:b0:441:b076:fce8 with SMTP id
 5b1f17b1804b1-44c91ad7026mr86945865e9.14.1748269524870; 
 Mon, 26 May 2025 07:25:24 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4cf7aa715sm7003240f8f.35.2025.05.26.07.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 07:25:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-rust@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 12/12] rust/hpet: Drop BqlCell wrapper for num_timers
Date: Mon, 26 May 2025 16:24:55 +0200
Message-ID: <20250526142455.1061519-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526142254.1061009-1-pbonzini@redhat.com>
References: <20250526142254.1061009-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 35Uv1fOj0fN4i3sWzoZIGHdmP8iCG9i-tj-IUmRrSUU_1748269526
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 26 May 2025 14:25:35 -0000

From: Zhao Liu <zhao1.liu@intel.com>

Now that the num_timers field is initialized as a property, someone may
change its default value using qdev_prop_set_uint8(), but the value is
fixed after the Rust code sees it first.  Since there is no need to modify
it after realize(), it is not to be necessary to have a BqlCell wrapper.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Link: https://lore.kernel.org/r/20250520152750.2542612-4-zhao1.liu@intel.com
[Remove .into() as well. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/hpet.rs | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
index b298938e4d5..3c5c65ff47d 100644
--- a/rust/hw/timer/hpet/src/hpet.rs
+++ b/rust/hw/timer/hpet/src/hpet.rs
@@ -562,7 +562,7 @@ pub struct HPETState {
     /// HPET timer array managed by this timer block.
     #[doc(alias = "timer")]
     timers: [BqlRefCell<HPETTimer>; HPET_MAX_TIMERS],
-    num_timers: BqlCell<usize>,
+    num_timers: usize,
     num_timers_save: BqlCell<u8>,
 
     /// Instance id (HPET timer block ID).
@@ -570,11 +570,6 @@ pub struct HPETState {
 }
 
 impl HPETState {
-    // Get num_timers with `usize` type, which is useful to play with array index.
-    fn get_num_timers(&self) -> usize {
-        self.num_timers.get()
-    }
-
     const fn has_msi_flag(&self) -> bool {
         self.flags & (1 << HPET_FLAG_MSI_SUPPORT_SHIFT) != 0
     }
@@ -636,7 +631,7 @@ fn set_cfg_reg(&self, shift: u32, len: u32, val: u64) {
             self.hpet_offset
                 .set(ticks_to_ns(self.counter.get()) - CLOCK_VIRTUAL.get_ns());
 
-            for timer in self.timers.iter().take(self.get_num_timers()) {
+            for timer in self.timers.iter().take(self.num_timers) {
                 let mut t = timer.borrow_mut();
 
                 if t.is_int_enabled() && t.is_int_active() {
@@ -648,7 +643,7 @@ fn set_cfg_reg(&self, shift: u32, len: u32, val: u64) {
             // Halt main counter and disable interrupt generation.
             self.counter.set(self.get_ticks());
 
-            for timer in self.timers.iter().take(self.get_num_timers()) {
+            for timer in self.timers.iter().take(self.num_timers) {
                 timer.borrow_mut().del_timer();
             }
         }
@@ -671,7 +666,7 @@ fn set_int_status_reg(&self, shift: u32, _len: u32, val: u64) {
         let new_val = val << shift;
         let cleared = new_val & self.int_status.get();
 
-        for (index, timer) in self.timers.iter().take(self.get_num_timers()).enumerate() {
+        for (index, timer) in self.timers.iter().take(self.num_timers).enumerate() {
             if cleared & (1 << index) != 0 {
                 timer.borrow_mut().update_irq(false);
             }
@@ -725,7 +720,7 @@ fn post_init(&self) {
     }
 
     fn realize(&self) -> qemu_api::Result<()> {
-        if self.num_timers.get() < HPET_MIN_TIMERS || self.num_timers.get() > HPET_MAX_TIMERS {
+        if self.num_timers < HPET_MIN_TIMERS || self.num_timers > HPET_MAX_TIMERS {
             Err(format!(
                 "hpet.num_timers must be between {HPET_MIN_TIMERS} and {HPET_MAX_TIMERS}"
             ))?;
@@ -743,7 +738,7 @@ fn realize(&self) -> qemu_api::Result<()> {
             1 << HPET_CAP_COUNT_SIZE_CAP_SHIFT |
             1 << HPET_CAP_LEG_RT_CAP_SHIFT |
             HPET_CAP_VENDER_ID_VALUE << HPET_CAP_VENDER_ID_SHIFT |
-            ((self.get_num_timers() - 1) as u64) << HPET_CAP_NUM_TIM_SHIFT | // indicate the last timer
+            ((self.num_timers - 1) as u64) << HPET_CAP_NUM_TIM_SHIFT | // indicate the last timer
             (HPET_CLK_PERIOD * FS_PER_NS) << HPET_CAP_CNT_CLK_PERIOD_SHIFT, // 10 ns
         );
 
@@ -753,7 +748,7 @@ fn realize(&self) -> qemu_api::Result<()> {
     }
 
     fn reset_hold(&self, _type: ResetType) {
-        for timer in self.timers.iter().take(self.get_num_timers()) {
+        for timer in self.timers.iter().take(self.num_timers) {
             timer.borrow_mut().reset();
         }
 
@@ -781,7 +776,7 @@ fn decode(&self, mut addr: hwaddr, size: u32) -> HPETAddrDecode {
             GlobalRegister::try_from(addr).map(HPETRegister::Global)
         } else {
             let timer_id: usize = ((addr - 0x100) / 0x20) as usize;
-            if timer_id <= self.get_num_timers() {
+            if timer_id < self.num_timers {
                 // TODO: Add trace point - trace_hpet_ram_[read|write]_timer_id(timer_id)
                 TimerRegister::try_from(addr & 0x18)
                     .map(|reg| HPETRegister::Timer(&self.timers[timer_id], reg))
@@ -852,12 +847,12 @@ fn pre_save(&self) -> i32 {
          * also added to the migration stream.  Check that it matches the value
          * that was configured.
          */
-        self.num_timers_save.set(self.num_timers.get() as u8);
+        self.num_timers_save.set(self.num_timers as u8);
         0
     }
 
     fn post_load(&self, _version_id: u8) -> i32 {
-        for timer in self.timers.iter().take(self.get_num_timers()) {
+        for timer in self.timers.iter().take(self.num_timers) {
             let mut t = timer.borrow_mut();
 
             t.cmp64 = t.calculate_cmp64(t.get_state().counter.get(), t.cmp);
@@ -882,7 +877,7 @@ fn is_offset_needed(&self) -> bool {
     }
 
     fn validate_num_timers(&self, _version_id: u8) -> bool {
-        self.num_timers.get() == self.num_timers_save.get().into()
+        self.num_timers == self.num_timers_save.get().into()
     }
 }
 
-- 
2.49.0


