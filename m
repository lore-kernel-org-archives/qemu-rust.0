Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJYlv-0003I1-AT
	for mharc-qemu-rust@gnu.org; Mon, 26 May 2025 10:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYld-00031R-G7
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlV-0007s4-Tn
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748269520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCEM65czXsckVgdrE6Ug61aKfrE1AOpspM5sfXzA4Eg=;
 b=iH/YiTiUBq/I+lGlGK7bflqdj7P3rsT5hkYC64nwI9ikAptr6wEtB84RDfiM2hpZUA+Lhk
 MQGFrIU+c4saLSqHXigHeD/Afr+Xm/PRPd3AndX2m8dlkoi5UORxFyHGxSe7W7Xz59xZop
 l12icExujrYeLdx5Hnd421Hs4oWTh8c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-ncXHTl8INAOLHYaEfJfdBA-1; Mon, 26 May 2025 10:25:19 -0400
X-MC-Unique: ncXHTl8INAOLHYaEfJfdBA-1
X-Mimecast-MFC-AGG-ID: ncXHTl8INAOLHYaEfJfdBA_1748269518
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a35ec8845cso1069590f8f.2
 for <qemu-rust@nongnu.org>; Mon, 26 May 2025 07:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748269518; x=1748874318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HCEM65czXsckVgdrE6Ug61aKfrE1AOpspM5sfXzA4Eg=;
 b=QFYJMjWhuRrph2X8yEK7new7nyaxxrICQc/zxFtGvwHqZvk2UZYzCHkaUIUVBJpZWj
 J9X6WO51DP5YEDaPRKSlGuB9Rr+hBuGhAE9bdQiHjPubS2gcJSZ83w/ylT3YKp3SinhR
 HORgJrkTTDkuX5uHB3hfXNpntaRVCBWG0FVQiSTpKO0nXpTIuZbfuT8Pea0AZwbsUhe4
 BsFu6HoXsd4cx9WDbiGnefAK4qsXK1+4ftyacLrz7a/LRaCy6bj2Irxc05w4mb8KvCO4
 GEO7LWn40Ocr3c3FNMG9MkAm88jEP8fYgmAaxgnRa0RAYnkyK/iV9xCO5oZS506g2JNr
 Iefg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC8knU4gIpTben9dRP548yCOPze2eK/oOeM1Y31Wqkrndm9XH01WkMQ9Obxyxhlox+GBFuHBVsmuU=@nongnu.org
X-Gm-Message-State: AOJu0YxbW6kgR5akpiQNyllLeoPFnL/Fj/78wd7TYf+cEusYsKw3XFo5
 zHwq4+cg6PU/hKVDbx5T09OocvtHj6CuK5NAtQY/dnuuHgP/3XiATdFUJhIYif/saj4F/rI4lrS
 y/0bKbWyVefSAhMynAfYNStZhEQWsv1F3MGDpvI8lwbo/21aHnhLC7hA=
X-Gm-Gg: ASbGncvUC2sav8tSOEXrE854HKAPWfZA1ZmJmi/VHOy5v5ItQzusEIfDiqTUjOWn9Ku
 t3UWZoHVoodnHPVh4Ze6MTJV7xsCaEzRJNRVy/1hnD1oQlSUj4Zt19K5gtQy6ct3Z3piSNCuT9l
 4/bEQj0laJUk1TpN+yW8t/VO6fpcijgkeSu1URd4Nwcg1q7DciytiRDhTjAmiIZIXfboxsAe2qW
 a9bJvHv1bjntrr4Q26+miQlOSDqXDeZCJA6dL9NiKtDcMEyOD5vM1YubDQkOCceve3V8Rgaocgi
 d5eTEvGUx/DauA==
X-Received: by 2002:a05:6000:1a8e:b0:3a4:dff9:e67b with SMTP id
 ffacd0b85a97d-3a4dff9eafdmr152708f8f.17.1748269518247; 
 Mon, 26 May 2025 07:25:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfbkehU3U+JeAZrdXdqbUjc3P++wGhCp/PpO1sFeZI7F63McqrK5ViP7tyi7bcpCsSTqZaRA==
X-Received: by 2002:a05:6000:1a8e:b0:3a4:dff9:e67b with SMTP id
 ffacd0b85a97d-3a4dff9eafdmr152688f8f.17.1748269517799; 
 Mon, 26 May 2025 07:25:17 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4d17266d5sm5839842f8f.68.2025.05.26.07.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 07:25:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 09/12] rust/hpet: change timer of num_timers to usize
Date: Mon, 26 May 2025 16:24:52 +0200
Message-ID: <20250526142455.1061519-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526142254.1061009-1-pbonzini@redhat.com>
References: <20250526142254.1061009-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8F1dmXzpMOz4NTmGTg8rrcg8oq1P1pmq7iscGMRteLw_1748269518
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Remove the need to convert after every read of the BqlCell.  Because the
vmstate uses a u8 as the size of the VARRAY, this requires switching
the VARRAY to use num_timers_save; which in turn requires ensuring that
the num_timers_save is always there.  For simplicity do this by
removing support for version 1, which QEMU has not been producing for
~15 years.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/hpet.rs | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
index 55eef669a9d..b2922e6a843 100644
--- a/rust/hw/timer/hpet/src/hpet.rs
+++ b/rust/hw/timer/hpet/src/hpet.rs
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


