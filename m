Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uOefu-0000Qy-Qi
	for mharc-qemu-rust@gnu.org; Mon, 09 Jun 2025 11:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uOefr-0000Me-FR
 for qemu-rust@nongnu.org; Mon, 09 Jun 2025 11:44:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uOefp-0007gp-PN
 for qemu-rust@nongnu.org; Mon, 09 Jun 2025 11:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749483873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5HjroMel8a6RF+nigSPUiqMo1YKd1zSm1exQlnXqhVE=;
 b=EORNcAeK5XifHK4HvnnJzfUEiGWiOWfNOEgqJL0MJCXey6SQE1fQlcduN7SsT1CPxcN2TK
 +33TJDkCszT9S0QOVGHX514IEHLkZazMyfM7uIVZ31rU+VESWcYUweiCFMSM/mjCneGH90
 oL+gxFPY+jkWPR5mHLy6x9Tk+mqbrYA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-4CWaS-LQOx--54PayB3MsQ-1; Mon, 09 Jun 2025 11:44:31 -0400
X-MC-Unique: 4CWaS-LQOx--54PayB3MsQ-1
X-Mimecast-MFC-AGG-ID: 4CWaS-LQOx--54PayB3MsQ_1749483870
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-440667e7f92so31250745e9.3
 for <qemu-rust@nongnu.org>; Mon, 09 Jun 2025 08:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749483870; x=1750088670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5HjroMel8a6RF+nigSPUiqMo1YKd1zSm1exQlnXqhVE=;
 b=t9QarwslZqrtU94JywIpIpdDV3820/0Qt8vR7tSinm4fbhTTpRjfuDPwfuPMS4fX86
 RXFY78L3iQ0kNmMldURigMb5EQBPzUOk6QPlOltSr8MtWEcNP7LQFPIhY8dSVZrlDL/g
 DjF4xaCnz5JghTfVf9fjr+DHnODQEv+w4PHYsHJEJeAo3u9Kh9WbcvgwUmfKHqdc8JF+
 3KnF/yOoNNp0MK16n6rNdzPFRh1SorMq8iJKheJKf3iG/yUnCguuooXkKYhLkTKHA2Mj
 sW/TD4QXbGjMrvITWZk+IGIvKnZmrx93HnPHj5Vwl0wLcCBU4mUViLyCzN8QlH6AZRG2
 uUew==
X-Gm-Message-State: AOJu0Yyplxssp6UDqk5+v7OUif8nd5ZGMbfCuN2tugmPoC7XMeZWax/z
 zKf5Y8RzNIP39W2Aq+aNLZ9Dtilc2uGF+4BwhzRqOwfzTcotF6A0AsUsF98hQw4AQzDtXwSUSma
 tCkf42iN8nta22TNWD1Mb+ukzDCm6Srm9RVbiDHgDUciNgCqQPdSwBzdEP9NU850=
X-Gm-Gg: ASbGncvy7yIh45cZiJZ87Kx5mNRyFQ8eni7D+dNfedGd01LH7n050NDpgiGUaoHb/E6
 bbYUJs5h244+hPQEIAzcNRSiKpQYNn8CjNaT0XSqUnkSwociG3nwCO3KpbgjLeoCzwXpxMYlZ67
 QyKTM9FTzZncSgaclO6gEiF1+YJEpdNzsbJfZlKgwO6JZEiBxB7itIwWwBqCMM37CZ7Y2YfEcpk
 QPMMdMTzywJI3WyBGOIdlfZVGSgizlQhChct77TkdUyC/ZC3xkyArmPNwyAZvJRPfLS4iSGDQRL
 aa5mVaRtaX1VEg==
X-Received: by 2002:a05:600c:8b23:b0:450:d37c:9fc8 with SMTP id
 5b1f17b1804b1-452013898d8mr134266385e9.13.1749483869932; 
 Mon, 09 Jun 2025 08:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF535ooEPbrZS5uS233pOZdaRmQSWaeSCD/MruHfVyfo1LgqyeQe8cN6CnFFxN99WP1nPwp5A==
X-Received: by 2002:a05:600c:8b23:b0:450:d37c:9fc8 with SMTP id
 5b1f17b1804b1-452013898d8mr134266155e9.13.1749483869432; 
 Mon, 09 Jun 2025 08:44:29 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452730d1686sm110576235e9.36.2025.06.09.08.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 08:44:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 2/5] rust: hpet: fully initialize object after instance_init
Date: Mon,  9 Jun 2025 17:44:20 +0200
Message-ID: <20250609154423.706056-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609154423.706056-1-pbonzini@redhat.com>
References: <20250609154423.706056-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QfSZWwXpjqyKqpFuzaJKYukYiD75QV2V2e-Sx6RqN5w_1749483870
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Mon, 09 Jun 2025 15:44:35 -0000

The array of BqlRefCell<HPETTimer> is not initialized yet at the
end of instance_init.  In particular, the "state" field is NonNull
and therefore it is invalid to have it as zero bytes.

Note that MaybeUninit is necessary because assigning to self.timers[index]
would trigger Drop of the old value.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/device.rs | 42 +++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 735b2fbef79..340ca1d355d 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -4,6 +4,7 @@
 
 use std::{
     ffi::{c_int, c_void, CStr},
+    mem::MaybeUninit,
     pin::Pin,
     ptr::{addr_of_mut, null_mut, NonNull},
     slice::from_ref,
@@ -25,6 +26,7 @@
     qom_isa,
     sysbus::{SysBusDevice, SysBusDeviceImpl},
     timer::{Timer, CLOCK_VIRTUAL, NANOSECONDS_PER_SECOND},
+    uninit_field_mut,
     vmstate::VMStateDescription,
     vmstate_fields, vmstate_of, vmstate_struct, vmstate_subsections, vmstate_validate,
     zeroable::Zeroable,
@@ -212,13 +214,13 @@ pub struct HPETTimer {
 }
 
 impl HPETTimer {
-    fn init(&mut self, index: u8, state: &HPETState) {
-        *self = HPETTimer {
+    fn new(index: u8, state: *const HPETState) -> HPETTimer {
+        HPETTimer {
             index,
             // SAFETY: the HPETTimer will only be used after the timer
             // is initialized below.
             qemu_timer: unsafe { Timer::new() },
-            state: NonNull::new((state as *const HPETState).cast_mut()).unwrap(),
+            state: NonNull::new(state.cast_mut()).unwrap(),
             config: 0,
             cmp: 0,
             fsb: 0,
@@ -226,19 +228,15 @@ fn init(&mut self, index: u8, state: &HPETState) {
             period: 0,
             wrap_flag: 0,
             last: 0,
-        };
+        }
+    }
 
+    fn init_timer_with_cell(cell: &BqlRefCell<Self>) {
+        let mut timer = cell.borrow_mut();
         // SAFETY: HPETTimer is only used as part of HPETState, which is
         // always pinned.
-        let qemu_timer = unsafe { Pin::new_unchecked(&mut self.qemu_timer) };
-        qemu_timer.init_full(
-            None,
-            CLOCK_VIRTUAL,
-            Timer::NS,
-            0,
-            timer_handler,
-            &state.timers[self.index as usize],
-        )
+        let qemu_timer = unsafe { Pin::new_unchecked(&mut timer.qemu_timer) };
+        qemu_timer.init_full(None, CLOCK_VIRTUAL, Timer::NS, 0, timer_handler, cell);
     }
 
     fn get_state(&self) -> &HPETState {
@@ -607,9 +605,18 @@ fn handle_legacy_irq(&self, irq: u32, level: u32) {
         }
     }
 
-    fn init_timer(&self) {
-        for (index, timer) in self.timers.iter().enumerate() {
-            timer.borrow_mut().init(index.try_into().unwrap(), self);
+    fn init_timers(this: &mut MaybeUninit<Self>) {
+        let state = this.as_ptr();
+        for index in 0..HPET_MAX_TIMERS {
+            let mut timer = uninit_field_mut!(*this, timers[index]);
+
+            // Initialize in two steps, to avoid calling Timer::init_full on a
+            // temporary that can be moved.
+            let timer = timer.write(BqlRefCell::new(HPETTimer::new(
+                index.try_into().unwrap(),
+                state,
+            )));
+            HPETTimer::init_timer_with_cell(timer);
         }
     }
 
@@ -710,6 +717,8 @@ unsafe fn init(&mut self) {
             "hpet",
             HPET_REG_SPACE_LEN,
         );
+
+        Self::init_timers(unsafe { &mut *((self as *mut Self).cast::<MaybeUninit<Self>>()) });
     }
 
     fn post_init(&self) {
@@ -731,7 +740,6 @@ fn realize(&self) -> qemu_api::Result<()> {
 
         self.hpet_id.set(HPETFwConfig::assign_hpet_id()?);
 
-        self.init_timer();
         // 64-bit General Capabilities and ID Register; LegacyReplacementRoute.
         self.capability.set(
             HPET_CAP_REV_ID_VALUE << HPET_CAP_REV_ID_SHIFT |
-- 
2.49.0


