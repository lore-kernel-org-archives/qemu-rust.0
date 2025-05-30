Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uKuiU-0002by-Ip
	for mharc-qemu-rust@gnu.org; Fri, 30 May 2025 04:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKuiH-0002XN-6z
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKuiE-0004cS-8N
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748592213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I9UYi4Cy39R5dTUfo2DeyIIhvEGm6Vs7YuCFqZJ0aIg=;
 b=POGHjB0HlwlaYODPMRm8idUTOOO+WHwougrNuS9N5XIh1FFY4fVUisr2/IRn8SyrKp3mnL
 glm3PsfaTa2jqprRFOftodlgzWsiMqMdL1WS6e19lCPDv4yOnYwuc/nfs8snXsMSD/J7SC
 FWYVpWpdksleGuQuoAAC1UMGSHHZWTs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-K_S_QwC-OCmo3MNNLCCdMg-1; Fri, 30 May 2025 04:03:32 -0400
X-MC-Unique: K_S_QwC-OCmo3MNNLCCdMg-1
X-Mimecast-MFC-AGG-ID: K_S_QwC-OCmo3MNNLCCdMg_1748592211
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-ab68fbe53a4so90905066b.2
 for <qemu-rust@nongnu.org>; Fri, 30 May 2025 01:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748592211; x=1749197011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I9UYi4Cy39R5dTUfo2DeyIIhvEGm6Vs7YuCFqZJ0aIg=;
 b=jwe0vxDNFND5iHjuya9INy6cD/k5/MrHe+qvqU26qO+X+9DDZmW3rbD9Ryh59PvDc7
 +Xm9vzON6SRzAGrPbYzmw5kwQonjVrlhTK4Al8n2LLgzd/A78AkcBLy9zlppGseeT+g8
 jlkNkx51YJJZB4bSlp7NgHvs6Pg/Sz4f8ictQJkgTsDGG87xRMwEHJIu+NWaPakf8i/U
 Zeo/c6BDo1bV2GWJhnLp/R58D+9+PERm4Yxk7lPqwI3Y09BSLSd9HQ98TVdpqknBJSSm
 mWAS2B1BPXQE9YE4eAtyJidCkp1xRuOFbSlRwE8byuzBraONZ6Vzb5hYCT/N3TNurKX0
 R3jg==
X-Gm-Message-State: AOJu0YxmWW3zUpRvooRNC5zL9NUTkyRbmfxUtqMJrjcZq6dJa+LINbCc
 fsiSlAchoBXetFyiz8g2DFutzNjUdj8Cwp5shYG7XDa4NssC3p1qRZiJfqKu+mGr+bwhKyQkns/
 xy6PsYkRb/TN0H2jfcTBU9b6m9saajaIDZaNqhDZD/bfSmLvBSDa3VFo=
X-Gm-Gg: ASbGncv1DDJUWS522z2zX3cJqXDvyJpCHkY9dv86uBJoJ5DdGT55Vbfa43eV9XecBSp
 gh/kXJJVNmpw+WX/6B9goQYf/3y6Y6d10660mWvhncU/P149CiF++NicUn9ePl+9qqiP1iTDUWc
 Gg3mSDxND2CiJIeh9RNRt5XhCDEeHnyeKC7yrVx8IWX4nwUOBzSabdZOgp2UlR9/IdkiubM9NwM
 xA7157YQdZjf2QPgasjyyVdOH36CXjiHBYNX/oRU9MNkMleCXtMKoC0qPPWbKItzOuGNyx97aRg
 8HbgTA8eu2qXXiyW1X/l+zGy
X-Received: by 2002:a17:907:9450:b0:ad8:9c97:c2da with SMTP id
 a640c23a62f3a-adb36bfb187mr113375566b.40.1748592210931; 
 Fri, 30 May 2025 01:03:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkp5F1NC9thYzOG8he490C6v6/TNy0j9MFH/yK+eGJ5b5OxeIRWqOL8unQCi4NlxlUbKXnDg==
X-Received: by 2002:a17:907:9450:b0:ad8:9c97:c2da with SMTP id
 a640c23a62f3a-adb36bfb187mr113358666b.40.1748592208152; 
 Fri, 30 May 2025 01:03:28 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada6ad39479sm281821066b.124.2025.05.30.01.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 01:03:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 08/14] rust: qdev: support returning errors from realize
Date: Fri, 30 May 2025 10:03:00 +0200
Message-ID: <20250530080307.2055502-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530080307.2055502-1-pbonzini@redhat.com>
References: <20250530080307.2055502-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HP7j2fp4cpecDwtO4Ef4jXPO1SfBX_7Al8DTYTBQHKE_1748592211
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
X-List-Received-Date: Fri, 30 May 2025 08:03:39 -0000

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs |  5 +++--
 rust/hw/timer/hpet/src/device.rs |  5 +++--
 rust/qemu-api/src/qdev.rs        | 10 ++++++----
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index bd5cee04647..1e715e91bc3 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -175,7 +175,7 @@ fn properties() -> &'static [Property] {
     fn vmsd() -> Option<&'static VMStateDescription> {
         Some(&device_class::VMSTATE_PL011)
     }
-    const REALIZE: Option<fn(&Self)> = Some(Self::realize);
+    const REALIZE: Option<fn(&Self) -> qemu_api::Result<()>> = Some(Self::realize);
 }
 
 impl ResettablePhasesImpl for PL011State {
@@ -619,9 +619,10 @@ fn event(&self, event: Event) {
         }
     }
 
-    fn realize(&self) {
+    fn realize(&self) -> qemu_api::Result<()> {
         self.char_backend
             .enable_handlers(self, Self::can_receive, Self::receive, Self::event);
+        Ok(())
     }
 
     fn reset_hold(&self, _type: ResetType) {
diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index e3ba62b2875..68c82b09b60 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -724,7 +724,7 @@ fn post_init(&self) {
         }
     }
 
-    fn realize(&self) {
+    fn realize(&self) -> qemu_api::Result<()> {
         if self.int_route_cap == 0 {
             // TODO: Add error binding: warn_report()
             println!("Hpet's hpet-intcap property not initialized");
@@ -751,6 +751,7 @@ fn realize(&self) {
 
         self.init_gpio_in(2, HPETState::handle_legacy_irq);
         self.init_gpio_out(from_ref(&self.pit_enabled));
+        Ok(())
     }
 
     fn reset_hold(&self, _type: ResetType) {
@@ -1042,7 +1043,7 @@ fn vmsd() -> Option<&'static VMStateDescription> {
         Some(&VMSTATE_HPET)
     }
 
-    const REALIZE: Option<fn(&Self)> = Some(Self::realize);
+    const REALIZE: Option<fn(&Self) -> qemu_api::Result<()>> = Some(Self::realize);
 }
 
 impl ResettablePhasesImpl for HPETState {
diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index 1279d7a58d5..81052097071 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -12,10 +12,11 @@
 pub use bindings::{ClockEvent, DeviceClass, Property, ResetType};
 
 use crate::{
-    bindings::{self, qdev_init_gpio_in, qdev_init_gpio_out, Error, ResettableClass},
+    bindings::{self, qdev_init_gpio_in, qdev_init_gpio_out, ResettableClass},
     callbacks::FnCall,
     cell::{bql_locked, Opaque},
     chardev::Chardev,
+    error::{Error, Result},
     irq::InterruptSource,
     prelude::*,
     qom::{ObjectClass, ObjectImpl, Owned},
@@ -108,7 +109,7 @@ pub trait DeviceImpl: ObjectImpl + ResettablePhasesImpl + IsA<DeviceState> {
     ///
     /// If not `None`, the parent class's `realize` method is overridden
     /// with the function pointed to by `REALIZE`.
-    const REALIZE: Option<fn(&Self)> = None;
+    const REALIZE: Option<fn(&Self) -> Result<()>> = None;
 
     /// An array providing the properties that the user can set on the
     /// device.  Not a `const` because referencing statics in constants
@@ -134,10 +135,11 @@ fn vmsd() -> Option<&'static VMStateDescription> {
 /// readable/writeable from one thread at any time.
 unsafe extern "C" fn rust_realize_fn<T: DeviceImpl>(
     dev: *mut bindings::DeviceState,
-    _errp: *mut *mut Error,
+    errp: *mut *mut bindings::Error,
 ) {
     let state = NonNull::new(dev).unwrap().cast::<T>();
-    T::REALIZE.unwrap()(unsafe { state.as_ref() });
+    let result = T::REALIZE.unwrap()(unsafe { state.as_ref() });
+    unsafe { Error::ok_or_propagate(result, errp); }
 }
 
 unsafe impl InterfaceType for ResettableClass {
-- 
2.49.0


