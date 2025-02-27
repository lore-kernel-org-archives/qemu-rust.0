Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnen5-0005LC-N7
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 09:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemg-0003sl-GC
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemc-00046j-S7
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740666157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tXHZ7ahE0SuDjTAp4gMKpg+0aMsCMDD4X5FjTPi4lj4=;
 b=EMUCFCSvizmJ7dloDfxUBc7DfaM1AjVGIbNZw3jBNkAJX55iYoUOVOlDizipQlkc5fxLjR
 Z9nmv7dx2Y2gh660lEufQn7pk8kdGxLF6pDb7iF8bU1iJWEhSdq6lnHih0QzTHUAtuRoa8
 znVWmNa8m2swYhSoiB2QVYEUx/BD6Jk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-jd1vjlCoPXWR_KQEUyzfqg-1; Thu, 27 Feb 2025 09:22:36 -0500
X-MC-Unique: jd1vjlCoPXWR_KQEUyzfqg-1
X-Mimecast-MFC-AGG-ID: jd1vjlCoPXWR_KQEUyzfqg_1740666156
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-abbc0572fc9so133511566b.0
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 06:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740666155; x=1741270955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tXHZ7ahE0SuDjTAp4gMKpg+0aMsCMDD4X5FjTPi4lj4=;
 b=qNc2vdXUcEU8DCakfJO/UBphUh7arMFHWmDa32hoFImzBojdZk/bkzuzg++hE1kF2N
 SCzZEqWl9S4Gga+PtN1N1AEnpLtDiJzjMd5zc5rwTUfRLOeeWF/f3xF6HJcPCsRYQ8Lc
 fuUmZxPLx7KC6/dw7EU0duqQWMSnTYbPV6aZW3nf8CDTYJ5MPDPeurG331zPDUHbgEgK
 LsL/WsGSxY9QGjC2Y/4hA8CG9HOTiEi1LdS/bFRAj3z4YajzeOZ5qe2GTmunjIcCS17e
 lzO7+QLxfE0g9WirfLsWGPJ++fSVnRlphLeRBe0bwr29ZI2v5hk50WbiODRhCfX/d9iC
 ro/Q==
X-Gm-Message-State: AOJu0YxhaemE481m/VhfW8tTOUt3l3SGWW572wT0EBf15nQjV96mOe02
 QGSLtSxhBiYqwISnvVCqp7N6vnDUNfwQGRUBRYvoLnxdGbB/asZf6J6H2Hh9UZMiqMlKM9fqMO8
 V+XCfR1/wsJx+6FXdpXI8gby1cbkYKtKLRPSWn+4m5dGc7woDFBDi7qmZBRrffg==
X-Gm-Gg: ASbGncv7ialY91y5k3JgvuCyFMLJ3mg0G65O5LEQtJ/h9AZ6ifGpW1MSzDiD0IHS9U3
 enS8f95GHAdHpwjWo2HOP6ylttQckuKq9LSqgxAeioI+iDfGCifRhYcSd5ofL8YWJxu4RtKwTuR
 0cO1b1du3zOPbf1kOtqF1fcXY+lSKXxeMfoN6/OdWwcc2QFjtR+RcXknD5Ve4seyQr1Om7eWqrf
 qs4QsfCrD6KwE2CbOiRw9pVe/Q8fu4bx/+YQUZaP4M/mug5BjJi98mv7pSREn4dSGXITAIzCdkU
 FTfqopvSlIQsV87N/ArB
X-Received: by 2002:a17:907:96a5:b0:ab7:fbb2:b47c with SMTP id
 a640c23a62f3a-abc09c1a51dmr3073940366b.35.1740666154767; 
 Thu, 27 Feb 2025 06:22:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8W9WmasNs4OKJbm4Y1M3y+D2krJAGkB7w6y4aLrIrrp8CdNeeKERQYmZcCAQRy1rDqxjJqQ==
X-Received: by 2002:a17:907:96a5:b0:ab7:fbb2:b47c with SMTP id
 a640c23a62f3a-abc09c1a51dmr3073937366b.35.1740666154343; 
 Thu, 27 Feb 2025 06:22:34 -0800 (PST)
Received: from [192.168.10.48] ([176.206.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c7c07d3sm128139866b.180.2025.02.27.06.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:22:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 06/12] rust: qom: wrap Object with Opaque<>
Date: Thu, 27 Feb 2025 15:22:13 +0100
Message-ID: <20250227142219.812270-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227142219.812270-1-pbonzini@redhat.com>
References: <20250227142219.812270-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uRIqkT6M2ORGpEwSSfv3tkyFibKWqRgoO_IZJjyenVY_1740666156
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Thu, 27 Feb 2025 14:22:46 -0000

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/bindings.rs |  3 ---
 rust/qemu-api/src/memory.rs   |  2 +-
 rust/qemu-api/src/qdev.rs     |  6 +++---
 rust/qemu-api/src/qom.rs      | 35 ++++++++++++++++++++++-------------
 4 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/rust/qemu-api/src/bindings.rs b/rust/qemu-api/src/bindings.rs
index d2868639ff6..be6dd68c09c 100644
--- a/rust/qemu-api/src/bindings.rs
+++ b/rust/qemu-api/src/bindings.rs
@@ -46,9 +46,6 @@ unsafe impl Sync for MemoryRegion {}
 unsafe impl Send for ObjectClass {}
 unsafe impl Sync for ObjectClass {}
 
-unsafe impl Send for Object {}
-unsafe impl Sync for Object {}
-
 unsafe impl Send for SysBusDevice {}
 unsafe impl Sync for SysBusDevice {}
 
diff --git a/rust/qemu-api/src/memory.rs b/rust/qemu-api/src/memory.rs
index 682951ab44e..713c494ca2e 100644
--- a/rust/qemu-api/src/memory.rs
+++ b/rust/qemu-api/src/memory.rs
@@ -157,7 +157,7 @@ unsafe fn do_init_io(
             let cstr = CString::new(name).unwrap();
             memory_region_init_io(
                 slot,
-                owner.cast::<Object>(),
+                owner.cast::<bindings::Object>(),
                 ops,
                 owner.cast::<c_void>(),
                 cstr.as_ptr(),
diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index c136457090c..1a4d1f38762 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -52,7 +52,7 @@ pub trait ResettablePhasesImpl {
 /// can be downcasted to type `T`. We also expect the device is
 /// readable/writeable from one thread at any time.
 unsafe extern "C" fn rust_resettable_enter_fn<T: ResettablePhasesImpl>(
-    obj: *mut Object,
+    obj: *mut bindings::Object,
     typ: ResetType,
 ) {
     let state = NonNull::new(obj).unwrap().cast::<T>();
@@ -65,7 +65,7 @@ pub trait ResettablePhasesImpl {
 /// can be downcasted to type `T`. We also expect the device is
 /// readable/writeable from one thread at any time.
 unsafe extern "C" fn rust_resettable_hold_fn<T: ResettablePhasesImpl>(
-    obj: *mut Object,
+    obj: *mut bindings::Object,
     typ: ResetType,
 ) {
     let state = NonNull::new(obj).unwrap().cast::<T>();
@@ -78,7 +78,7 @@ pub trait ResettablePhasesImpl {
 /// can be downcasted to type `T`. We also expect the device is
 /// readable/writeable from one thread at any time.
 unsafe extern "C" fn rust_resettable_exit_fn<T: ResettablePhasesImpl>(
-    obj: *mut Object,
+    obj: *mut bindings::Object,
     typ: ResetType,
 ) {
     let state = NonNull::new(obj).unwrap().cast::<T>();
diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index 5488643a2fd..2defbd23516 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -101,16 +101,24 @@
     ptr::NonNull,
 };
 
-pub use bindings::{Object, ObjectClass};
+pub use bindings::ObjectClass;
 
 use crate::{
     bindings::{
         self, object_class_dynamic_cast, object_dynamic_cast, object_get_class,
         object_get_typename, object_new, object_ref, object_unref, TypeInfo,
     },
-    cell::bql_locked,
+    cell::{bql_locked, Opaque},
 };
 
+/// A safe wrapper around [`bindings::Object`].
+#[repr(transparent)]
+#[derive(Debug, qemu_api_macros::Wrapper)]
+pub struct Object(Opaque<bindings::Object>);
+
+unsafe impl Send for Object {}
+unsafe impl Sync for Object {}
+
 /// Marker trait: `Self` can be statically upcasted to `P` (i.e. `P` is a direct
 /// or indirect parent of `Self`).
 ///
@@ -199,7 +207,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> Result<(), fmt::Error> {
     }
 }
 
-unsafe extern "C" fn rust_instance_init<T: ObjectImpl>(obj: *mut Object) {
+unsafe extern "C" fn rust_instance_init<T: ObjectImpl>(obj: *mut bindings::Object) {
     let mut state = NonNull::new(obj).unwrap().cast::<T>();
     // SAFETY: obj is an instance of T, since rust_instance_init<T>
     // is called from QOM core as the instance_init function
@@ -209,7 +217,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> Result<(), fmt::Error> {
     }
 }
 
-unsafe extern "C" fn rust_instance_post_init<T: ObjectImpl>(obj: *mut Object) {
+unsafe extern "C" fn rust_instance_post_init<T: ObjectImpl>(obj: *mut bindings::Object) {
     let state = NonNull::new(obj).unwrap().cast::<T>();
     // SAFETY: obj is an instance of T, since rust_instance_post_init<T>
     // is called from QOM core as the instance_post_init function
@@ -230,7 +238,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> Result<(), fmt::Error> {
     <T as ObjectImpl>::CLASS_INIT(unsafe { klass.as_mut() })
 }
 
-unsafe extern "C" fn drop_object<T: ObjectImpl>(obj: *mut Object) {
+unsafe extern "C" fn drop_object<T: ObjectImpl>(obj: *mut bindings::Object) {
     // SAFETY: obj is an instance of T, since drop_object<T> is called
     // from the QOM core function object_deinit() as the instance_finalize
     // function for class T.  Note that while object_deinit() will drop the
@@ -280,14 +288,14 @@ pub unsafe trait ObjectType: Sized {
     /// Return the receiver as an Object.  This is always safe, even
     /// if this type represents an interface.
     fn as_object(&self) -> &Object {
-        unsafe { &*self.as_object_ptr() }
+        unsafe { &*self.as_ptr().cast() }
     }
 
     /// Return the receiver as a const raw pointer to Object.
     /// This is preferrable to `as_object_mut_ptr()` if a C
     /// function only needs a `const Object *`.
-    fn as_object_ptr(&self) -> *const Object {
-        self.as_ptr().cast()
+    fn as_object_ptr(&self) -> *const bindings::Object {
+        self.as_object().as_ptr()
     }
 
     /// Return the receiver as a mutable raw pointer to Object.
@@ -297,8 +305,8 @@ fn as_object_ptr(&self) -> *const Object {
     /// This cast is always safe, but because the result is mutable
     /// and the incoming reference is not, this should only be used
     /// for calls to C functions, and only if needed.
-    unsafe fn as_object_mut_ptr(&self) -> *mut Object {
-        self.as_object_ptr() as *mut _
+    unsafe fn as_object_mut_ptr(&self) -> *mut bindings::Object {
+        self.as_object().as_mut_ptr()
     }
 }
 
@@ -621,7 +629,7 @@ pub trait ObjectImpl: ObjectType + IsA<Object> {
 /// We expect the FFI user of this function to pass a valid pointer that
 /// can be downcasted to type `T`. We also expect the device is
 /// readable/writeable from one thread at any time.
-unsafe extern "C" fn rust_unparent_fn<T: ObjectImpl>(dev: *mut Object) {
+unsafe extern "C" fn rust_unparent_fn<T: ObjectImpl>(dev: *mut bindings::Object) {
     let state = NonNull::new(dev).unwrap().cast::<T>();
     T::UNPARENT.unwrap()(unsafe { state.as_ref() });
 }
@@ -796,8 +804,9 @@ fn new() -> Owned<Self> {
         // SAFETY: the object created by object_new is allocated on
         // the heap and has a reference count of 1
         unsafe {
-            let obj = &*object_new(Self::TYPE_NAME.as_ptr());
-            Owned::from_raw(obj.unsafe_cast::<Self>())
+            let raw_obj = object_new(Self::TYPE_NAME.as_ptr());
+            let obj = Object::from_raw(raw_obj).unsafe_cast::<Self>();
+            Owned::from_raw(obj)
         }
     }
 }
-- 
2.48.1


