Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uN7eU-0008U6-K7
	for mharc-qemu-rust@gnu.org; Thu, 05 Jun 2025 06:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7e5-0007W6-Dr
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7e2-0001MO-Im
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749118581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1xUwrRORHhhFQcsqo0wojfaEACCcvTZjPhl1zMHXkSg=;
 b=JCP9mQbEocsELatpWWTt83iqzkS+RlU2jJ/zrPlbgynoiYD+VUI/QEcaWZfJhhdonzYVSH
 jzpp2SkmYQ2eWoW13J7ncBZfcVmlL/l6H10qdTnq0HBWYKw8UwX/1aTlZUlvEEmb4ajaAf
 MPckAad2vNTqWuZqeGV4H5jbCh2hXy4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-fjnHNVp6OYKOYpjVdHHPDA-1; Thu, 05 Jun 2025 06:16:20 -0400
X-MC-Unique: fjnHNVp6OYKOYpjVdHHPDA-1
X-Mimecast-MFC-AGG-ID: fjnHNVp6OYKOYpjVdHHPDA_1749118580
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-451e24dfe1dso6188805e9.0
 for <qemu-rust@nongnu.org>; Thu, 05 Jun 2025 03:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749118579; x=1749723379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1xUwrRORHhhFQcsqo0wojfaEACCcvTZjPhl1zMHXkSg=;
 b=WMMYL/tHCS1IZOj0aNPJ+SGUVAbyg1jq8+Gj6pPR6oJCGOEcUoALYLFb+IFOpZdoNS
 9uMPL+kxtKuf7oJNjkSlF4ZSTZoxBz4G+l88MljLj0UoJZ4ABvfPp+ZfPi6ENpeFHc4j
 x2/Gdeoz28TUIoF5Z+j81oA85IjRL2lulGvMXLIaoGF+juLlkJV8LKOtGjD9DHUSdw/Q
 EjAveDZBEppklyt2LARAm5efYr2kE7aKLhQuRx/Na6W7lEdxh51pkjBP3bniDaY8NglX
 yNtcjti+UNJfQq3fay8bxF8YJYo+SIwkeH31AoAoRQF9OTLrt7OZBxiulY+BbPq9U4K5
 ENUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS6P37D99ei2uuHHqbawtGr0UbRNtk73Y0mjB8SSVkSiJ6PXj0KcNzFoLsLuU6ul3JBRhBamNlTyc=@nongnu.org
X-Gm-Message-State: AOJu0YxidbVNROi+4HplYqZfZtkDMY5v8nnmQIBC/dWm6WMXqCRYgyz4
 TtsG19AZNA0TLXlGaA+o4PDrUZWRp2vFXFv6JGDjziIKfNF5kCTGGR9DgPbCOk7wx9p+xKGN4K/
 kgeDrZFWXrp9SOX8VEYRYpxgXfZ9iki44o1DRT3X8mYylSNjnXc8+USogmIYLrIs=
X-Gm-Gg: ASbGncsvZsDNO/QfDwbSp/7sCLZgj6wQe9w5OBtGZohK4G4AzVVANY0jVDUwLiNhb26
 WslUfuWy5jNuqnTBVOUe7K1PQon9YSj08Gk0t+mA5Qb1FTcoozzeth7sGW74aZ7F66Ks/2sPVCq
 +8fLklKn3zVYxe5bVN0Aq8zCvDVUHw0heNrA6RrDioeBN+rXWYyAf1BAN/3+slgZCEx8MFELyDI
 UMxow4bmxN/8uRahUAAi9Kpben1ixbAWyQnW+7vOUm8+Z4b2IS8ZmXiU0IbnT6wOIY9lt4lbN17
 MnJJDeBz6Y4HFA==
X-Received: by 2002:a05:600c:1d84:b0:43d:3df:42d8 with SMTP id
 5b1f17b1804b1-451f0a64c4cmr53785565e9.6.1749118579250; 
 Thu, 05 Jun 2025 03:16:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNcZLwOs2u9JwWGMIdhJQ9swpozmLgt/TD9ypDjOGC/rRKShoqQPBaCJ6/uhIWVEgYPUYhKA==
X-Received: by 2002:a05:600c:1d84:b0:43d:3df:42d8 with SMTP id
 5b1f17b1804b1-451f0a64c4cmr53785275e9.6.1749118578721; 
 Thu, 05 Jun 2025 03:16:18 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a521c64d22sm3794332f8f.48.2025.06.05.03.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:16:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 13/14] rust/hpet: Drop BqlCell wrapper for num_timers
Date: Thu,  5 Jun 2025 12:15:42 +0200
Message-ID: <20250605101544.368953-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605101544.368953-1-pbonzini@redhat.com>
References: <20250605101544.368953-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FQP3PGJh9xki5Utp3-QLmSEWh3SrG9yQ7Ja4gXKcUwg_1749118580
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
X-List-Received-Date: Thu, 05 Jun 2025 10:16:32 -0000

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
 rust/hw/timer/hpet/src/device.rs | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index cd439f90b7e..735b2fbef79 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
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


