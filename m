Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBsl3-0005ST-O5
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 06:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBsl1-0005Ri-T3
 for qemu-rust@nongnu.org; Mon, 05 May 2025 06:09:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBskz-0007C8-0K
 for qemu-rust@nongnu.org; Mon, 05 May 2025 06:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746439744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o4eJEJ6LUK5A+acUKlwgi0vs0hdZWNs63Wrhl4hER54=;
 b=Mx2SZrVVCLDNBFcWIRtlXt85TREJTlJo62p0qGVPhOw04w7jFU0a2EaRkVuU+1LbcagMsM
 h85b6Z/9RJN73oRsvPP3AyPAjtY7PIpkFH3LxOv2zhYzR9yxPGLqSWPmrfRl8/2MoCxloD
 0VM/cufrEzNOkXH0CQLF8uQD8DAV3Dk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-nBypBU9dPrK_3zDz6jprVw-1; Mon, 05 May 2025 06:09:02 -0400
X-MC-Unique: nBypBU9dPrK_3zDz6jprVw-1
X-Mimecast-MFC-AGG-ID: nBypBU9dPrK_3zDz6jprVw_1746439741
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d4d15058dso30073245e9.0
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 03:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746439741; x=1747044541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o4eJEJ6LUK5A+acUKlwgi0vs0hdZWNs63Wrhl4hER54=;
 b=Zz08jR9XAcwwCECfOWws8ENE6KWtebc9JJf79hYo+bXDIXSvP7tDHxY3KPNpS80WpU
 bByGEvx2F2UGZm3vkB4riQIWMPOpDaAWUdfJTRaum7oxpbFSsJPcqbl8rfIBX0TWGq7G
 DkxOgG6FsI0Hzg0+PUgRDOewNfUYkHyDjDRMra2sRekIFWRIL029caPt85HWHkyxv/LP
 D9H/SlY/uIZo4yt1De/88scJDZkcYGGBWd7uSgtjm5WXuGZTrdM7u/2SIqQNbSFtY1Mp
 ljPa7qM/r0r9yJSvy1Fw/YF0DHiLE1INcP4eo6DjTRPtOL8BftyIf0CZ4A7C9zVTY34F
 sLdA==
X-Gm-Message-State: AOJu0YxbKEMv+PrH5jgwZJYzq3Wjc8i8QJl//n+PZ1C3EC8vRT5NXeSd
 7BaChPN9ONyIqzrQ6Q0ZXJlNZuOpf6FcHjvdxai0IBaMIEBSPp73IMvJewAgPb9iB+boXbPB9MG
 BPbcZqNmd3Bocrp3hsJ0LU9MAc3BhJybNakB80Ho/9tAkEVJSHfQ+VnDLEyk=
X-Gm-Gg: ASbGncsImorCJvTXhnHDLzCE57f/NC/1Mg14VJQ5SOeoRsIg9N+DBjFTQTuRVYpMKFG
 W1WiBBrWxoCf/EaG9e41fVpgE1StY8ywouo68kLorKvwNJPxtWlNYzbvkNX4HMQB2kqSgNn+8dx
 MDpG40FYXvpyIH3DdG660K8/TMDU93c72sA9iYdjP6youJmuz/MVhXhEVoUBLxTxujq2L8SzoK9
 iCmvfe+BbbYy6MveXNRelacGzKTYtfIWUKWgR2HCBHu/spPAz+Izz+9pt9NeTM6g5Bg4VBLq/DA
 xAH8vHOZypAW44I=
X-Received: by 2002:a05:600c:3d8e:b0:43e:a7c9:8d2b with SMTP id
 5b1f17b1804b1-441c4919de9mr53226035e9.24.1746439740831; 
 Mon, 05 May 2025 03:09:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNr2lFzAub5aEOX7AAocy2B9+yhvcltYQ3gJYxA/xfXsF1K8RluuFCzthU2kAVLvsSoDlJTQ==
X-Received: by 2002:a05:600c:3d8e:b0:43e:a7c9:8d2b with SMTP id
 5b1f17b1804b1-441c4919de9mr53225865e9.24.1746439740404; 
 Mon, 05 May 2025 03:09:00 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b20b36sm175419965e9.25.2025.05.05.03.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 03:08:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 2/5] rust: use inline const expressions
Date: Mon,  5 May 2025 12:08:51 +0200
Message-ID: <20250505100854.73936-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505100854.73936-1-pbonzini@redhat.com>
References: <20250505100854.73936-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qyDWCa8h3N1Nm7vmR3girbzGYljZRAbnRsoZA0EiiuA_1746439741
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 05 May 2025 10:09:08 -0000

They were stabilized in Rust 1.79.0.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst            |  9 +++------
 rust/qemu-api/src/callbacks.rs | 27 +--------------------------
 rust/qemu-api/src/chardev.rs   |  2 +-
 rust/qemu-api/src/qdev.rs      |  2 +-
 rust/qemu-api/src/timer.rs     |  2 +-
 rust/qemu-api/src/vmstate.rs   |  2 +-
 6 files changed, 8 insertions(+), 36 deletions(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 139c298d462..cc52adcfdbe 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -75,9 +75,6 @@ QEMU supports rustc version 1.83.0 and newer.  The following features
 from relatively new versions of Rust are not used for historical reasons;
 patches are welcome:
 
-* inline const expression (stable in 1.79.0), currently worked around with
-  associated constants in the ``FnCall`` trait.
-
 * associated constants are still explicitly marked ``'static`` (`changed in
   1.81.0`__)
 
@@ -88,9 +85,9 @@ patches are welcome:
   architecture (VMState).  Right now, VMState lacks type safety because
   it is hard to place the ``VMStateField`` definitions in traits.
 
-* associated const equality would be nice to have for some users of
-  ``callbacks::FnCall``, but is still experimental.  ``ASSERT_IS_SOME``
-  replaces it.
+Associated const equality would be nice to have for some users of
+``callbacks::FnCall``, but is still experimental.  Const assertions
+are used instead.
 
 __ https://github.com/rust-lang/rust/pull/125258
 
diff --git a/rust/qemu-api/src/callbacks.rs b/rust/qemu-api/src/callbacks.rs
index 9642a16eb89..dbe2305f509 100644
--- a/rust/qemu-api/src/callbacks.rs
+++ b/rust/qemu-api/src/callbacks.rs
@@ -113,31 +113,6 @@
 /// This is always true for zero-capture closures and function pointers, as long
 /// as the code is able to name the function in the first place.
 pub unsafe trait FnCall<Args, R = ()>: 'static + Sync + Sized {
-    /// Referring to this internal constant asserts that the `Self` type is
-    /// zero-sized.  Can be replaced by an inline const expression in
-    /// Rust 1.79.0+.
-    const ASSERT_ZERO_SIZED: () = { assert!(mem::size_of::<Self>() == 0) };
-
-    /// Referring to this constant asserts that the `Self` type is an actual
-    /// function type, which can be used to catch incorrect use of `()`
-    /// at compile time.
-    ///
-    /// # Examples
-    ///
-    /// ```compile_fail
-    /// # use qemu_api::callbacks::FnCall;
-    /// fn call_it<F: for<'a> FnCall<(&'a str,), String>>(_f: &F, s: &str) -> String {
-    ///     let _: () = F::ASSERT_IS_SOME;
-    ///     F::call((s,))
-    /// }
-    ///
-    /// let s: String = call_it((), "hello world"); // does not compile
-    /// ```
-    ///
-    /// Note that this can be more simply `const { assert!(F::IS_SOME) }` in
-    /// Rust 1.79.0 or newer.
-    const ASSERT_IS_SOME: () = { assert!(Self::IS_SOME) };
-
     /// `true` if `Self` is an actual function type and not `()`.
     ///
     /// # Examples
@@ -195,7 +170,7 @@ unsafe impl<F, $($args,)* R> FnCall<($($args,)*), R> for F
 
             #[inline(always)]
             fn call(a: ($($args,)*)) -> R {
-                let _: () = Self::ASSERT_ZERO_SIZED;
+                const { assert!(mem::size_of::<Self>() == 0) };
 
                 // SAFETY: the safety of this method is the condition for implementing
                 // `FnCall`.  As to the `NonNull` idiom to create a zero-sized type,
diff --git a/rust/qemu-api/src/chardev.rs b/rust/qemu-api/src/chardev.rs
index 6e0590d758e..cb27be52569 100644
--- a/rust/qemu-api/src/chardev.rs
+++ b/rust/qemu-api/src/chardev.rs
@@ -138,7 +138,7 @@ pub fn enable_handlers<
             F::call((owner, event))
         }
 
-        let _: () = CanReceiveFn::ASSERT_IS_SOME;
+        const { assert!(CanReceiveFn::IS_SOME) };
         let receive_cb: Option<unsafe extern "C" fn(*mut c_void, *const u8, c_int)> =
             if ReceiveFn::is_some() {
                 Some(rust_receive_cb::<T, ReceiveFn>)
diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index 1279d7a58d5..6c93805a742 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -358,7 +358,7 @@ fn do_init_gpio_in(
             }
         }
 
-        let _: () = F::ASSERT_IS_SOME;
+        const { assert!(F::IS_SOME) };
         unsafe extern "C" fn rust_irq_handler<T, F: for<'a> FnCall<(&'a T, u32, u32)>>(
             opaque: *mut c_void,
             line: c_int,
diff --git a/rust/qemu-api/src/timer.rs b/rust/qemu-api/src/timer.rs
index 868bd88575f..66d39df37d8 100644
--- a/rust/qemu-api/src/timer.rs
+++ b/rust/qemu-api/src/timer.rs
@@ -56,7 +56,7 @@ pub fn init_full<'timer, 'opaque: 'timer, T, F>(
     ) where
         F: for<'a> FnCall<(&'a T,)>,
     {
-        let _: () = F::ASSERT_IS_SOME;
+        const { assert!(F::IS_SOME) };
 
         /// timer expiration callback
         unsafe extern "C" fn rust_timer_handler<T, F: for<'a> FnCall<(&'a T,)>>(
diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 9c8b2398e9d..c564bd70308 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -457,7 +457,7 @@ macro_rules! vmstate_exist_fn {
         const fn test_cb_builder__<T, F: for<'a> $crate::callbacks::FnCall<(&'a T, u8), bool>>(
             _phantom: ::core::marker::PhantomData<F>,
         ) -> $crate::vmstate::VMSFieldExistCb {
-            let _: () = F::ASSERT_IS_SOME;
+            const { assert!(F::IS_SOME) };
             $crate::vmstate::rust_vms_test_field_exists::<T, F>
         }
 
-- 
2.49.0


