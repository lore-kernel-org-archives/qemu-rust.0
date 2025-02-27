Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnh1g-0000AH-SJ
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 11:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnh1I-0008PK-01
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 11:45:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnh1C-0007om-Ky
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 11:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740674749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5E7+LJSBoOz/G+zWX1NXdeqa/d5B+5NoEKi7sRBRBUw=;
 b=Srje2g9FGetTaBGvls3DtnrZ2hYtqAFtvUvvtWH4CyIhTMpro0WU32cjidOOTvxP661PNA
 8xJJW0GsTNmEcTl7BCVhUkS9//brXxQvUhoeC82bbv+vrQvfmlaihRbDVH5+RnEa453+wc
 Rnozww7oH74y09NwmMfQhUoKXN3/O9U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-nFGo7TjENl-o2cPHCiYMRQ-1; Thu, 27 Feb 2025 11:45:43 -0500
X-MC-Unique: nFGo7TjENl-o2cPHCiYMRQ-1
X-Mimecast-MFC-AGG-ID: nFGo7TjENl-o2cPHCiYMRQ_1740674743
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ab77dd2c243so222533966b.0
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 08:45:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740674742; x=1741279542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5E7+LJSBoOz/G+zWX1NXdeqa/d5B+5NoEKi7sRBRBUw=;
 b=aiwCqwd6huSXVP9jhM4zB9CWVYDffGPgfHGXOADKR7qGX9qwFuWjEjCU+N5YBuSdVI
 VbKFoKZZZpCFyLOQEYYgJfVO+077j789D6JbzaZjCqlmHIFEzDfRb7kWOaNOu3uvpurk
 XMODD8VcZlRpd+BQKYPJR8K5+I23sY8QW6ZNnL2S7/Wt9G9iL0Y/obvnvumG+RKSV9j+
 LC+MQ9sQju+K25eL4IahGUEWJ0+tPRIfnDns+h+0aYZ3qBot/FFVrhxhTSSuQcJB1eYO
 KiinpMLlnN6yTPAq0klR3vYQt0fYakeUw2jHUsEk5CvatslKUsN5bwW9TkiH4hvbppRr
 0+Jw==
X-Gm-Message-State: AOJu0Yx+bMGtnRHDTdKbOfze5xDAo8GMnYxVDWcmRx9AAqEOW4XHp8fX
 HWtGca5Ow520bJjZEVtKekX9cQpXquIFaEEwIlZX0x+JuX6bfHT+2TlGVUcngy3ae2VdCC5SNgj
 +Z6Ze+/DPZZKr7RCT8idJI88cT7V3QMzZLItF20v78Y+ux4FHreCFRjvcgzmPLQ==
X-Gm-Gg: ASbGnctltMZzCEYSulYrlAgw38jHrp60UPG0dGuUViV+QRatmVDdwaQvdTKMMJrfOnV
 yYRZxnAA2bR1pI/L7nlo72SPAiG7zU4NP6FhO6pQWw8ro83vUtuvzQdHL6EPpmyUZ+zaaKljnRh
 3FjJTCBRHkKzI0mne+YcNyd3SixOdBB3vVht7uU9KGaa4nMNfg1iyLyYFKHo4+EOfCJaEGZBaLQ
 Rlj5DUR9qMvle4eb/ikAjkH7DOnxZXdtCypnUjkJB70WHOyR28+4jqqeMjhjwduKJGO5ZxMX3kX
 JWaB4dKO98ZZ+woMmg==
X-Received: by 2002:a17:907:7b89:b0:abf:1a67:1ff2 with SMTP id
 a640c23a62f3a-abf25fd9f37mr12746266b.13.1740674741872; 
 Thu, 27 Feb 2025 08:45:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0apzfMHXfdNPZQVyS+XwDNXoZYA63AHcMBdruHD52EYyYsWEGSXQE3mp9VeU/JFY5uSqfRw==
X-Received: by 2002:a17:907:7b89:b0:abf:1a67:1ff2 with SMTP id
 a640c23a62f3a-abf25fd9f37mr12743866b.13.1740674741285; 
 Thu, 27 Feb 2025 08:45:41 -0800 (PST)
Received: from [192.168.1.84] ([93.56.163.127])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c6ee486sm149558566b.90.2025.02.27.08.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 08:45:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 1/5] rust: chardev: provide basic bindings to character devices
Date: Thu, 27 Feb 2025 17:45:30 +0100
Message-ID: <20250227164538.814576-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227164538.814576-1-pbonzini@redhat.com>
References: <20250227164538.814576-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: obT3YW1HJYgS8q9RGc5hr5MTCfXO2IvRzALTL5pKiao_1740674743
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
X-List-Received-Date: Thu, 27 Feb 2025 16:46:01 -0000

Most of the character device API is pretty simple, with "0 or -errno"
or "number of bytes or -errno" as the convention for return codes.
Add safe wrappers for the API to the CharBackend bindgen-generated
struct.

The API is not complete, but it covers the parts that are used
by the PL011 device, plus qemu_chr_fe_write which is needed to
implement the standard library Write trait.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/meson.build     |  17 ++-
 rust/qemu-api/src/chardev.rs  | 237 +++++++++++++++++++++++++++++++++-
 rust/qemu-api/src/zeroable.rs |   1 +
 3 files changed, 250 insertions(+), 5 deletions(-)

diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index 6e52c4bad74..a3f226ccc2a 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -54,7 +54,19 @@ qemu_api = declare_dependency(link_with: _qemu_api_rs)
 rust_qemu_api_objs = static_library(
     'rust_qemu_api_objs',
     objects: [libqom.extract_all_objects(recursive: false),
-              libhwcore.extract_all_objects(recursive: false)])
+              libhwcore.extract_all_objects(recursive: false),
+              libchardev.extract_all_objects(recursive: false),
+              libcrypto.extract_all_objects(recursive: false),
+              libauthz.extract_all_objects(recursive: false),
+              libio.extract_all_objects(recursive: false)])
+rust_qemu_api_deps = declare_dependency(
+    dependencies: [
+      qom_ss.dependencies(),
+      chardev_ss.dependencies(),
+      crypto_ss.dependencies(),
+      authz_ss.dependencies(),
+      io_ss.dependencies()],
+    link_whole: [rust_qemu_api_objs, libqemuutil])
 
 test('rust-qemu-api-integration',
     executable(
@@ -63,8 +75,7 @@ test('rust-qemu-api-integration',
         override_options: ['rust_std=2021', 'build.rust_std=2021'],
         rust_args: ['--test'],
         install: false,
-        dependencies: [qemu_api, qemu_api_macros],
-        link_whole: [rust_qemu_api_objs, libqemuutil]),
+        dependencies: [qemu_api, qemu_api_macros, rust_qemu_api_deps]),
     args: [
         '--test', '--test-threads', '1',
         '--format', 'pretty',
diff --git a/rust/qemu-api/src/chardev.rs b/rust/qemu-api/src/chardev.rs
index a35b9217e90..3281844fd4e 100644
--- a/rust/qemu-api/src/chardev.rs
+++ b/rust/qemu-api/src/chardev.rs
@@ -3,10 +3,23 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 //! Bindings for character devices
+//!
+//! Character devices in QEMU can run under the big QEMU lock or in a separate
+//! `GMainContext`. Here we only support the former, because the bindings
+//! enforce that the BQL is taken whenever the functions in [`CharBackend`] are
+//! called.
 
-use std::ffi::CStr;
+use std::{
+    ffi::CStr,
+    fmt::{self, Debug},
+    io::{self, ErrorKind, Write},
+    marker::PhantomPinned,
+    os::raw::{c_int, c_void},
+    ptr::addr_of_mut,
+    slice,
+};
 
-use crate::{bindings, cell::Opaque, prelude::*};
+use crate::{bindings, callbacks::FnCall, cell::{BqlRefMut, Opaque}, prelude::*};
 
 /// A safe wrapper around [`bindings::Chardev`].
 #[repr(transparent)]
@@ -14,6 +27,226 @@
 pub struct Chardev(Opaque<bindings::Chardev>);
 
 pub type ChardevClass = bindings::ChardevClass;
+pub type Event = bindings::QEMUChrEvent;
+
+/// A safe wrapper around [`bindings::CharBackend`], denoting the character
+/// back-end that is used for example by a device.  Compared to the
+/// underlying C struct it adds BQL protection, and is marked as pinned
+/// because the QOM object ([`bindings::Chardev`]) contains a pointer to
+/// the `CharBackend`.
+pub struct CharBackend {
+    inner: BqlRefCell<bindings::CharBackend>,
+    _pin: PhantomPinned,
+}
+
+impl Write for BqlRefMut<'_, bindings::CharBackend> {
+    fn flush(&mut self) -> io::Result<()> {
+        Ok(())
+    }
+
+    fn write(&mut self, buf: &[u8]) -> io::Result<usize> {
+        let chr: &mut bindings::CharBackend = self;
+
+        let len = buf.len().try_into().unwrap();
+        let r = unsafe { bindings::qemu_chr_fe_write(addr_of_mut!(*chr), buf.as_ptr(), len) };
+        errno::into_io_result(r).map(|cnt| cnt as usize)
+    }
+
+    fn write_all(&mut self, buf: &[u8]) -> io::Result<()> {
+        let chr: &mut bindings::CharBackend = self;
+
+        let len = buf.len().try_into().unwrap();
+        let r = unsafe { bindings::qemu_chr_fe_write_all(addr_of_mut!(*chr), buf.as_ptr(), len) };
+        errno::into_io_result(r).and_then(|cnt| {
+            if cnt as usize == buf.len() {
+                Ok(())
+            } else {
+                Err(ErrorKind::WriteZero.into())
+            }
+        })
+    }
+}
+
+impl Debug for CharBackend {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        // SAFETY: accessed just to print the values
+        let chr = self.inner.as_ptr();
+        Debug::fmt(unsafe { &*chr }, f)
+    }
+}
+
+// FIXME: use something like PinnedDrop from the pinned_init crate
+impl Drop for CharBackend {
+    fn drop(&mut self) {
+        self.disable_handlers();
+    }
+}
+
+impl CharBackend {
+    /// Enable the front-end's character device handlers, if there is an
+    /// associated `Chardev`.
+    pub fn enable_handlers<
+        'chardev,
+        'owner: 'chardev,
+        T,
+        CanReceiveFn: for<'a> FnCall<(&'a T,), u32>,
+        ReceiveFn: for<'a, 'b> FnCall<(&'a T, &'b [u8])>,
+        EventFn: for<'a> FnCall<(&'a T, Event)>,
+    >(
+        // When "self" is dropped, the handlers are automatically disabled.
+        // However, this is not necessarily true if the owner is dropped.
+        // So require the owner to outlive the character device.
+        &'chardev self,
+        owner: &'owner T,
+        _can_receive: CanReceiveFn,
+        _receive: ReceiveFn,
+        _event: EventFn,
+    ) {
+        unsafe extern "C" fn rust_can_receive_cb<T, F: for<'a> FnCall<(&'a T,), u32>>(
+            opaque: *mut c_void,
+        ) -> c_int {
+            // SAFETY: the values are safe according to the contract of
+            // enable_handlers() and qemu_chr_fe_set_handlers()
+            let owner: &T = unsafe { &*(opaque.cast::<T>()) };
+            let r = F::call((owner,));
+            r.try_into().unwrap()
+        }
+
+        unsafe extern "C" fn rust_receive_cb<T, F: for<'a, 'b> FnCall<(&'a T, &'b [u8])>>(
+            opaque: *mut c_void,
+            buf: *const u8,
+            size: c_int,
+        ) {
+            // SAFETY: the values are safe according to the contract of
+            // enable_handlers() and qemu_chr_fe_set_handlers()
+            let owner: &T = unsafe { &*(opaque.cast::<T>()) };
+            let buf = unsafe { slice::from_raw_parts(buf, size.try_into().unwrap()) };
+            F::call((owner, buf))
+        }
+
+        unsafe extern "C" fn rust_event_cb<T, F: for<'a> FnCall<(&'a T, Event)>>(
+            opaque: *mut c_void,
+            event: Event,
+        ) {
+            // SAFETY: the values are safe according to the contract of
+            // enable_handlers() and qemu_chr_fe_set_handlers()
+            let owner: &T = unsafe { &*(opaque.cast::<T>()) };
+            F::call((owner, event))
+        }
+
+        let _: () = CanReceiveFn::ASSERT_IS_SOME;
+        let receive_cb: Option<unsafe extern "C" fn(*mut c_void, *const u8, c_int)> =
+            if ReceiveFn::is_some() {
+                Some(rust_receive_cb::<T, ReceiveFn>)
+            } else {
+                None
+            };
+        let event_cb: Option<unsafe extern "C" fn(*mut c_void, Event)> = if EventFn::is_some() {
+            Some(rust_event_cb::<T, EventFn>)
+        } else {
+            None
+        };
+
+        let mut chr = self.inner.borrow_mut();
+        // SAFETY: the borrow promises that the BQL is taken
+        unsafe {
+            bindings::qemu_chr_fe_set_handlers(
+                addr_of_mut!(*chr),
+                Some(rust_can_receive_cb::<T, CanReceiveFn>),
+                receive_cb,
+                event_cb,
+                None,
+                (owner as *const T as *mut T).cast::<c_void>(),
+                core::ptr::null_mut(),
+                true,
+            );
+        }
+    }
+
+    /// Disable the front-end's character device handlers.
+    pub fn disable_handlers(&self) {
+        let mut chr = self.inner.borrow_mut();
+        // SAFETY: the borrow promises that the BQL is taken
+        unsafe {
+            bindings::qemu_chr_fe_set_handlers(
+                addr_of_mut!(*chr),
+                None,
+                None,
+                None,
+                None,
+                core::ptr::null_mut(),
+                core::ptr::null_mut(),
+                true,
+            );
+        }
+    }
+
+    /// Notify that the frontend is ready to receive data.
+    pub fn accept_input(&self) {
+        let mut chr = self.inner.borrow_mut();
+        // SAFETY: the borrow promises that the BQL is taken
+        unsafe { bindings::qemu_chr_fe_accept_input(addr_of_mut!(*chr)) }
+    }
+
+    /// Temporarily borrow the character device, allowing it to be used
+    /// as an implementor of `Write`.  Note that it is not valid to drop
+    /// the big QEMU lock while the character device is borrowed, as
+    /// that might cause C code to write to the character device.
+    pub fn borrow_mut(&self) -> impl Write + '_ {
+        self.inner.borrow_mut()
+    }
+
+    /// Send a continuous stream of zero bits on the line if `enabled` is
+    /// true, or a short stream if `enabled` is false.
+    pub fn send_break(&self, long: bool) -> io::Result<()> {
+        let mut chr = self.inner.borrow_mut();
+        let mut duration: c_int = long.into();
+        // SAFETY: the borrow promises that the BQL is taken
+        let r = unsafe {
+            bindings::qemu_chr_fe_ioctl(
+                addr_of_mut!(*chr),
+                bindings::CHR_IOCTL_SERIAL_SET_BREAK as i32,
+                addr_of_mut!(duration).cast::<c_void>(),
+            )
+        };
+
+        errno::into_io_result(r).map(|_| ())
+    }
+
+    /// Write data to a character backend from the front end.  This function
+    /// will send data from the front end to the back end.  Unlike
+    /// `write`, this function will block if the back end cannot
+    /// consume all of the data attempted to be written.
+    ///
+    /// Returns the number of bytes consumed (0 if no associated Chardev) or an
+    /// error.
+    pub fn write(&self, buf: &[u8]) -> io::Result<usize> {
+        let len = buf.len().try_into().unwrap();
+        // SAFETY: qemu_chr_fe_write is thread-safe
+        let r = unsafe { bindings::qemu_chr_fe_write(self.inner.as_ptr(), buf.as_ptr(), len) };
+        errno::into_io_result(r).map(|cnt| cnt as usize)
+    }
+
+    /// Write data to a character backend from the front end.  This function
+    /// will send data from the front end to the back end.  Unlike
+    /// `write`, this function will block if the back end cannot
+    /// consume all of the data attempted to be written.
+    ///
+    /// Returns the number of bytes consumed (0 if no associated Chardev) or an
+    /// error.
+    pub fn write_all(&self, buf: &[u8]) -> io::Result<()> {
+        let len = buf.len().try_into().unwrap();
+        // SAFETY: qemu_chr_fe_write_all is thread-safe
+        let r = unsafe { bindings::qemu_chr_fe_write_all(self.inner.as_ptr(), buf.as_ptr(), len) };
+        errno::into_io_result(r).and_then(|cnt| {
+            if cnt as usize == buf.len() {
+                Ok(())
+            } else {
+                Err(ErrorKind::WriteZero.into())
+            }
+        })
+    }
+}
 
 unsafe impl ObjectType for Chardev {
     type Class = ChardevClass;
diff --git a/rust/qemu-api/src/zeroable.rs b/rust/qemu-api/src/zeroable.rs
index 47b6977828d..a3415a2ebcc 100644
--- a/rust/qemu-api/src/zeroable.rs
+++ b/rust/qemu-api/src/zeroable.rs
@@ -106,3 +106,4 @@ fn default() -> Self {
 impl_zeroable!(crate::bindings::MemoryRegionOps__bindgen_ty_2);
 impl_zeroable!(crate::bindings::MemoryRegionOps);
 impl_zeroable!(crate::bindings::MemTxAttrs);
+impl_zeroable!(crate::bindings::CharBackend);
-- 
2.48.1


