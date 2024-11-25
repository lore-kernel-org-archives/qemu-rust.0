Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tFU6O-0004sp-5p
	for mharc-qemu-rust@gnu.org; Mon, 25 Nov 2024 03:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tFU6H-0004rp-U9
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 03:05:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tFU6B-0007Ln-QM
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 03:05:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732521935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1jI5qwsUNqYvHHAVfyTEysqObilmnJhAcwQxA2HPEU=;
 b=bV+nLTJklRX6CVyI7fzm7LIFy38+pO84LqiycNiXwLcdgr0B8zAbQN5jt+CaS1rWGlJnfI
 7wAs+82dlyg497DXAYqEb9Y/5iLSaO23bjvnhk6CsHG940Mfwa6sO4rxn/IshBImZR65mr
 Vz2zx1W7c2JTomX3zCaMFjnBycJtaT8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-XlEfkkgFPGmBSZlw8P2U1g-1; Mon, 25 Nov 2024 03:05:32 -0500
X-MC-Unique: XlEfkkgFPGmBSZlw8P2U1g-1
X-Mimecast-MFC-AGG-ID: XlEfkkgFPGmBSZlw8P2U1g
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43499c1342aso9700305e9.1
 for <qemu-rust@nongnu.org>; Mon, 25 Nov 2024 00:05:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732521931; x=1733126731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z1jI5qwsUNqYvHHAVfyTEysqObilmnJhAcwQxA2HPEU=;
 b=b4QWROM7+M1wfFqfoY6cc/dO4yTpa12+BgqhYbFz6h6tpOSKqpH8tFnAONV37+AQtW
 McGoipEZAYoLBRjWO0m72eAbdcHRqtUcfJ5xo2/4yIiIS3ClPDgRFowMh31/u3TOruf8
 xNZ9OWt7VA8dO+namKPTtPGSmIfHu1Qtvtcs56dqkcXxLg4YMYFCmJ3jM4E+FyHMKou3
 XJHzSIB5g4A4Azk4lm+GvRYhSn/b469JMY8HxLWQoykDPHPNheJm0AgYk7abPIXYGwaj
 R6I784fjLKmvBLqFyCYF31+zptwdSXc8Wp78UiyOODfx+msPbHKUm0NRrZxZ+1H0zdKi
 yJOg==
X-Gm-Message-State: AOJu0YyXkAsvmBZPxTdh1UYcUcfNhJ2bEJ6QnkqxmXtlcPMgF5e0EwLv
 4By/zmrwbTJuRtGXeF6NMEc3AeOjO3QRL0EnRk06mwPE1cnro5E/plbmWH0x48EQJzQsKzoFmYd
 UZv6jZejd5ZqEQ0CHIdQF5eyrmDf1vZXSIyrCB3P1sthKNZTS9MnAf1NMP0w=
X-Gm-Gg: ASbGncvw8GuAMxn0smvl7Rnmm+5WMkzUrBJWB4Mqft1jN1OEIPMWa7b09e6uoMOoSvI
 bYykMocDZHp9obKs+QKXufRp8c4PSteb24i6wqqOmlXtwJiGELWRgw3dsoefOz6vslMIbCEp9SM
 52w1Fs90TwR/PVVnsFW/7XTyZxR4u6Y7sazxmhiyCTzi4nVtvCRMSEzkpDauuVfvMtewwzhTQrQ
 DgZ4QDJkPMMIbJDoMVq3DeDqm2/7HSYuDopCUvWtHdnCo/XKsuVr/8=
X-Received: by 2002:a05:600c:3b08:b0:426:5e91:3920 with SMTP id
 5b1f17b1804b1-433ce4e9d8emr96978385e9.29.1732521931105; 
 Mon, 25 Nov 2024 00:05:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUCAmD2lWimxDZqMtrhgQNdPh6ETlm00iNBGKIMmjBARDD9AzUJXk0guOTS38HePIIzum8+w==
X-Received: by 2002:a05:600c:3b08:b0:426:5e91:3920 with SMTP id
 5b1f17b1804b1-433ce4e9d8emr96978165e9.29.1732521930697; 
 Mon, 25 Nov 2024 00:05:30 -0800 (PST)
Received: from [192.168.10.47] ([151.49.236.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349cc29406sm53524305e9.0.2024.11.25.00.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 00:05:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 8/8] rust: qom: move bridge for TypeInfo functions out of pl011
Date: Mon, 25 Nov 2024 09:05:07 +0100
Message-ID: <20241125080507.115450-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125080507.115450-1-pbonzini@redhat.com>
References: <20241125080507.115450-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UqfKUAKGGm8oQUyWm02bhTcYRrPvwm83qCCJrHxPbVo_1732521932
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.93,
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
X-List-Received-Date: Mon, 25 Nov 2024 08:05:44 -0000

Allow the ObjectImpl trait to expose Rust functions that avoid raw
pointers (though INSTANCE_INIT for example is still unsafe).
ObjectImpl::TYPE_INFO adds thunks around the functions in
ObjectImpl.

While at it, document `TypeInfo`.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 40 +++++++---------------
 rust/qemu-api/src/definitions.rs | 57 +++++++++++++++++++++++++++++---
 2 files changed, 65 insertions(+), 32 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index aeccce5186c..08f7faf00d3 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -110,7 +110,7 @@ impl ObjectImpl for PL011State {
     type Class = PL011Class;
     const TYPE_NAME: &'static CStr = crate::TYPE_PL011;
     const PARENT_TYPE_NAME: Option<&'static CStr> = Some(TYPE_SYS_BUS_DEVICE);
-    const INSTANCE_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = Some(pl011_init);
+    const INSTANCE_INIT: Option<unsafe fn(&mut Self)> = Some(Self::init);
 }
 
 #[repr(C)]
@@ -615,19 +615,6 @@ pub fn post_load(&mut self, _version_id: u32) -> Result<(), ()> {
     }
 }
 
-/// # Safety
-///
-/// We expect the FFI user of this function to pass a valid pointer, that has
-/// the same size as [`PL011State`]. We also expect the device is
-/// readable/writeable from one thread at any time.
-pub unsafe extern "C" fn pl011_init(obj: *mut Object) {
-    unsafe {
-        debug_assert!(!obj.is_null());
-        let mut state = NonNull::new_unchecked(obj.cast::<PL011State>());
-        state.as_mut().init();
-    }
-}
-
 #[repr(C)]
 #[derive(Debug, qemu_api_macros::Object)]
 /// PL011 Luminary device model.
@@ -640,19 +627,16 @@ pub struct PL011LuminaryClass {
     _inner: [u8; 0],
 }
 
-/// Initializes a pre-allocated, unitialized instance of `PL011Luminary`.
-///
-/// # Safety
-///
-/// We expect the FFI user of this function to pass a valid pointer, that has
-/// the same size as [`PL011Luminary`]. We also expect the device is
-/// readable/writeable from one thread at any time.
-pub unsafe extern "C" fn pl011_luminary_init(obj: *mut Object) {
-    unsafe {
-        debug_assert!(!obj.is_null());
-        let mut state = NonNull::new_unchecked(obj.cast::<PL011Luminary>());
-        let state = state.as_mut();
-        state.parent_obj.device_id = DeviceId::Luminary;
+impl PL011Luminary {
+    /// Initializes a pre-allocated, unitialized instance of `PL011Luminary`.
+    ///
+    /// # Safety
+    ///
+    /// We expect the FFI user of this function to pass a valid pointer, that
+    /// has the same size as [`PL011Luminary`]. We also expect the device is
+    /// readable/writeable from one thread at any time.
+    unsafe fn init(&mut self) {
+        self.parent_obj.device_id = DeviceId::Luminary;
     }
 }
 
@@ -660,7 +644,7 @@ impl ObjectImpl for PL011Luminary {
     type Class = PL011LuminaryClass;
     const TYPE_NAME: &'static CStr = crate::TYPE_PL011_LUMINARY;
     const PARENT_TYPE_NAME: Option<&'static CStr> = Some(crate::TYPE_PL011);
-    const INSTANCE_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = Some(pl011_luminary_init);
+    const INSTANCE_INIT: Option<unsafe fn(&mut Self)> = Some(Self::init);
 }
 
 impl DeviceImpl for PL011Luminary {}
diff --git a/rust/qemu-api/src/definitions.rs b/rust/qemu-api/src/definitions.rs
index d64a581a5cc..b20c53f6ce6 100644
--- a/rust/qemu-api/src/definitions.rs
+++ b/rust/qemu-api/src/definitions.rs
@@ -8,6 +8,20 @@
 
 use crate::bindings::{Object, ObjectClass, TypeInfo};
 
+unsafe extern "C" fn rust_instance_init<T: ObjectImpl>(obj: *mut Object) {
+    // SAFETY: obj is an instance of T, since drop_object<T>
+    // is called from QOM core as the instance_finalize function
+    // for class T
+    unsafe { T::INSTANCE_INIT.unwrap()(&mut *obj.cast::<T>()) }
+}
+
+unsafe extern "C" fn rust_instance_post_init<T: ObjectImpl>(obj: *mut Object) {
+    // SAFETY: obj is an instance of T, since drop_object<T>
+    // is called from QOM core as the instance_finalize function
+    // for class T
+    T::INSTANCE_POST_INIT.unwrap()(unsafe { &mut *obj.cast::<T>() })
+}
+
 unsafe extern "C" fn drop_object<T: ObjectImpl>(obj: *mut Object) {
     // SAFETY: obj is an instance of T, since drop_object<T>
     // is called from QOM core as the instance_finalize function
@@ -16,13 +30,42 @@
 }
 
 /// Trait a type must implement to be registered with QEMU.
+///
+/// # Safety
+///
+/// - the struct must be `#[repr(C)]`
+///
+/// - `Class` and `TYPE` must match the data in the `TypeInfo` (this is
+///   automatic if the class is defined via `ObjectImpl`).
+///
+/// - the first field of the struct must be of the instance struct corresponding
+///   to the superclass declared as `PARENT_TYPE_NAME`
 pub trait ObjectImpl: ClassInitImpl + Sized {
+    /// The QOM class object corresponding to this struct.  Not used yet.
     type Class;
+
+    /// The name of the type, which can be passed to `object_new()` to
+    /// generate an instance of this type.
     const TYPE_NAME: &'static CStr;
+
+    /// The parent of the type.  This should match the first field of
+    /// the struct that implements `ObjectImpl`:
     const PARENT_TYPE_NAME: Option<&'static CStr>;
+
+    /// Whether the object can be instantiated
     const ABSTRACT: bool = false;
-    const INSTANCE_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
-    const INSTANCE_POST_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
+
+    /// Function that is called to initialize an object.  The parent class will
+    /// have already been initialized so the type is only responsible for
+    /// initializing its own members.
+    ///
+    /// FIXME: The argument is not really a valid reference. `&mut
+    /// MaybeUninit<Self>` would be a better description.
+    const INSTANCE_INIT: Option<unsafe fn(&mut Self)> = None;
+
+    /// Function that is called to finish initialization of an object, once
+    /// `INSTANCE_INIT` functions have been called.
+    const INSTANCE_POST_INIT: Option<fn(&mut Self)> = None;
 
     const TYPE_INFO: TypeInfo = TypeInfo {
         name: Self::TYPE_NAME.as_ptr(),
@@ -33,8 +76,14 @@ pub trait ObjectImpl: ClassInitImpl + Sized {
         },
         instance_size: core::mem::size_of::<Self>(),
         instance_align: core::mem::align_of::<Self>(),
-        instance_init: Self::INSTANCE_INIT,
-        instance_post_init: Self::INSTANCE_POST_INIT,
+        instance_init: match Self::INSTANCE_INIT {
+            None => None,
+            Some(_) => Some(rust_instance_init::<Self>),
+        },
+        instance_post_init: match Self::INSTANCE_POST_INIT {
+            None => None,
+            Some(_) => Some(rust_instance_post_init::<Self>),
+        },
         instance_finalize: Some(drop_object::<Self>),
         abstract_: Self::ABSTRACT,
         class_size: core::mem::size_of::<Self::Class>(),
-- 
2.47.0


