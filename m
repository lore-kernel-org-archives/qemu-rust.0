Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJYlz-0003QE-7b
	for mharc-qemu-rust@gnu.org; Mon, 26 May 2025 10:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlW-0002zg-5W
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlS-0007rJ-5r
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748269517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b83n7BN9K+QBZzi9RoIqpz7fGe04sSc+YOYqMVO8GK0=;
 b=ZfiBw37RjZThj3zYe+EyPTFul89win5PPpkMYG7Q8xfJOjNj2YwrTnrnL7/QvMCQ4P5wm7
 dC0GM+9xJzeE78NfuLyVT57aVEMwF3fPHoNJNQ3LNwbHiD+qn8jJNIpLQhFhYo6ou94BVy
 bPhK7XpaGqYizAIu9T8l5XFnJiJCroY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-EDKatw4eNBe7wGtqFmy6Yw-1; Mon, 26 May 2025 10:25:16 -0400
X-MC-Unique: EDKatw4eNBe7wGtqFmy6Yw-1
X-Mimecast-MFC-AGG-ID: EDKatw4eNBe7wGtqFmy6Yw_1748269515
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-442e0e6eb84so14249585e9.0
 for <qemu-rust@nongnu.org>; Mon, 26 May 2025 07:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748269514; x=1748874314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b83n7BN9K+QBZzi9RoIqpz7fGe04sSc+YOYqMVO8GK0=;
 b=UGjqdxaH8VUxk6v8GDiCAPRCGY6GvjnCpArurkFxBkb6cdK1XBJxYEpzTVYLE9Xuin
 DZChbgCjiIaXXvyVrSWIrzixCJbAgVP7vjsYKBgAtX4ODxEbvMc+sGkXkwm7By1l1PjE
 1dq1sWuEXe6vG60fKOHa8hYGV7WHYEaUfvaUHQKe9h54WcOropuykAS/jWqbuc6Qr4QZ
 yLhJphJ4VBLlQl1Uz4plzo3g01STyXg/T8LmokijYhiG6RouVfRLzAWP9b87IIhtXh4r
 icFS45jpAXS86kWG794diEsilj4sFsyEsHKLeLYVvbicUpAliH4dKUtbTGR+oc1QnBFf
 eYpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXLw3BWb3ccKlYI0qvzCR3Tlxasp5cIPwlpjEhXfNNt43vgtP04s+eFvIyTsVcXZcvE7NzFcekiXo=@nongnu.org
X-Gm-Message-State: AOJu0Yx4/9/jnFge8flV6BtsCREUCbWSrrx8y7uhZoz3pmeQj2hJsRiz
 tYw0ZNrsloPZE8EpJazQWk77JuOekE0uwNzhPe9sVgZSl5ouIaj0kne4HEpyWGGstq4i/ZM+mKi
 5HHrfYauKf/BmAPEZ8UADjAmyai9xDYQUgkrFQ4cLePyhIU3gthul+zIzaBUjb+w=
X-Gm-Gg: ASbGncsY18vk5LY+mRWaV4Y1ijQPvKPa+cWCvZnKt7OZbU64nRBtMCTnt1qtm4jYG9v
 SFk3SAnGSx2aIOURSxLqSOX/KKX6BI/jO8jlJn7jtoSRkpBo/wnyj+fmGIc71ouytKrdswr7/rw
 vM1PXafjdiebNAW1Ewseb9kvX4b2BV4mw3kuiXz31LYxFigfa2SZdvE1Y477xnBBI9Qwwn6kWRM
 50SxmbdKIQrMZI+jXzeX2R3sF3nxkEMo9kg6B4DsrRzcdWc0BkP8EsOFOt+fvSBBPPfXSgW6gPl
 gzwIWg5tsaBTyQ==
X-Received: by 2002:a05:600c:3b19:b0:442:e9eb:cba2 with SMTP id
 5b1f17b1804b1-44c8f25dab7mr97415755e9.0.1748269513590; 
 Mon, 26 May 2025 07:25:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2A3zP9aqvcSQw4Bi0aQN0k9xWjyVVLsmsO1gX6OQrJ2qQcDKYfyy4FpJUNdO3EcwUS9cV0g==
X-Received: by 2002:a05:600c:3b19:b0:442:e9eb:cba2 with SMTP id
 5b1f17b1804b1-44c8f25dab7mr97415485e9.0.1748269513115; 
 Mon, 26 May 2025 07:25:13 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f3dd99absm235569045e9.37.2025.05.26.07.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 07:25:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 07/12] qemu-api: add bindings to Error
Date: Mon, 26 May 2025 16:24:50 +0200
Message-ID: <20250526142455.1061519-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526142254.1061009-1-pbonzini@redhat.com>
References: <20250526142254.1061009-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lDBvSsoO0u0P9uYlnsEWKf1pXiiFb140cdJvub-qDkA_1748269515
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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

Provide an implementation of std::error::Error that bridges the Rust
anyhow::Error and std::panic::Location types with QEMU's Error*.
It also has several utility methods, analogous to error_propagate(),
that convert a Result into a return value + Error** pair.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/Cargo.lock            |  17 +++
 rust/Cargo.toml            |   1 +
 rust/meson.build           |   2 +
 rust/qemu-api/Cargo.toml   |   2 +
 rust/qemu-api/meson.build  |   3 +-
 rust/qemu-api/src/error.rs | 273 +++++++++++++++++++++++++++++++++++++
 rust/qemu-api/src/lib.rs   |   3 +
 7 files changed, 300 insertions(+), 1 deletion(-)
 create mode 100644 rust/qemu-api/src/error.rs

diff --git a/rust/Cargo.lock b/rust/Cargo.lock
index 13d580c693b..37fd10064f9 100644
--- a/rust/Cargo.lock
+++ b/rust/Cargo.lock
@@ -2,6 +2,12 @@
 # It is not intended for manual editing.
 version = 3
 
+[[package]]
+name = "anyhow"
+version = "1.0.98"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e16d2d3311acee920a9eb8d33b8cbc1787ce4a264e85f964c2404b969bdcd487"
+
 [[package]]
 name = "arbitrary-int"
 version = "1.2.7"
@@ -37,6 +43,15 @@ version = "1.12.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "3dca9240753cf90908d7e4aac30f630662b02aebaa1b58a3cadabdb23385b58b"
 
+[[package]]
+name = "foreign"
+version = "0.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "37dd09e47ea8fd592a333f59fc52b894a97fe966ae9c6b7ef21ae38de6043462"
+dependencies = [
+ "libc",
+]
+
 [[package]]
 name = "hpet"
 version = "0.1.0"
@@ -106,6 +121,8 @@ dependencies = [
 name = "qemu_api"
 version = "0.1.0"
 dependencies = [
+ "anyhow",
+ "foreign",
  "libc",
  "qemu_api_macros",
 ]
diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index d9faeecb10b..2726b1f72e3 100644
--- a/rust/Cargo.toml
+++ b/rust/Cargo.toml
@@ -67,6 +67,7 @@ multiple_crate_versions = "deny"
 mut_mut = "deny"
 needless_bitwise_bool = "deny"
 needless_pass_by_ref_mut = "deny"
+needless_update = "deny"
 no_effect_underscore_binding = "deny"
 option_option = "deny"
 or_fun_call = "deny"
diff --git a/rust/meson.build b/rust/meson.build
index 3e0b6ed4afa..9eb69174dea 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -1,11 +1,13 @@
 subproject('anyhow-1.0-rs', required: true)
 subproject('bilge-0.2-rs', required: true)
 subproject('bilge-impl-0.2-rs', required: true)
+subproject('foreign-0.2-rs', required: true)
 subproject('libc-0.2-rs', required: true)
 
 anyhow_rs = dependency('anyhow-1.0-rs')
 bilge_rs = dependency('bilge-0.2-rs')
 bilge_impl_rs = dependency('bilge-impl-0.2-rs')
+foreign_rs = dependency('foreign-0.2-rs')
 libc_rs = dependency('libc-0.2-rs')
 
 subproject('proc-macro2-1-rs', required: true)
diff --git a/rust/qemu-api/Cargo.toml b/rust/qemu-api/Cargo.toml
index c96cf50e7a1..ca6b81db10a 100644
--- a/rust/qemu-api/Cargo.toml
+++ b/rust/qemu-api/Cargo.toml
@@ -15,7 +15,9 @@ rust-version.workspace = true
 
 [dependencies]
 qemu_api_macros = { path = "../qemu-api-macros" }
+anyhow = "~1.0"
 libc = "0.2.162"
+foreign = "~0.2"
 
 [features]
 default = ["debug_cell"]
diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index 1ea86b8bbf1..11cbd6d375a 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -19,6 +19,7 @@ _qemu_api_rs = static_library(
       'src/cell.rs',
       'src/chardev.rs',
       'src/errno.rs',
+      'src/error.rs',
       'src/irq.rs',
       'src/memory.rs',
       'src/module.rs',
@@ -35,7 +36,7 @@ _qemu_api_rs = static_library(
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
   rust_abi: 'rust',
   rust_args: _qemu_api_cfg,
-  dependencies: [libc_rs, qemu_api_macros],
+  dependencies: [anyhow_rs, foreign_rs, libc_rs, qemu_api_macros],
 )
 
 rust.test('rust-qemu-api-tests', _qemu_api_rs,
diff --git a/rust/qemu-api/src/error.rs b/rust/qemu-api/src/error.rs
new file mode 100644
index 00000000000..f08fed81028
--- /dev/null
+++ b/rust/qemu-api/src/error.rs
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+//! Error class for QEMU Rust code
+//!
+//! @author Paolo Bonzini
+
+use std::{
+    borrow::Cow,
+    ffi::{c_char, c_int, c_void, CStr},
+    fmt::{self, Display},
+    panic, ptr,
+};
+
+use foreign::{prelude::*, OwnedPointer};
+
+use crate::{
+    bindings,
+    bindings::{error_free, error_get_pretty},
+};
+
+pub type Result<T> = std::result::Result<T, Error>;
+
+#[derive(Debug, Default)]
+pub struct Error {
+    msg: Option<Cow<'static, str>>,
+    /// Appends the print string of the error to the msg if not None
+    cause: Option<anyhow::Error>,
+    file: &'static str,
+    line: u32,
+}
+
+impl std::error::Error for Error {
+    fn source(&self) -> Option<&(dyn std::error::Error + 'static)> {
+        self.cause.as_ref().map(AsRef::as_ref)
+    }
+
+    #[allow(deprecated)]
+    fn description(&self) -> &str {
+        self.msg
+            .as_deref()
+            .or_else(|| self.cause.as_deref().map(std::error::Error::description))
+            .unwrap_or("error")
+    }
+}
+
+impl Display for Error {
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        let mut prefix = "";
+        if let Some(ref msg) = self.msg {
+            write!(f, "{msg}")?;
+            prefix = ": ";
+        }
+        if let Some(ref cause) = self.cause {
+            write!(f, "{prefix}{cause}")?;
+        } else if prefix.is_empty() {
+            f.write_str("unknown error")?;
+        }
+        Ok(())
+    }
+}
+
+impl From<String> for Error {
+    #[track_caller]
+    fn from(msg: String) -> Self {
+        let location = panic::Location::caller();
+        Error {
+            msg: Some(Cow::Owned(msg)),
+            file: location.file(),
+            line: location.line(),
+            ..Default::default()
+        }
+    }
+}
+
+impl From<&'static str> for Error {
+    #[track_caller]
+    fn from(msg: &'static str) -> Self {
+        let location = panic::Location::caller();
+        Error {
+            msg: Some(Cow::Borrowed(msg)),
+            file: location.file(),
+            line: location.line(),
+            ..Default::default()
+        }
+    }
+}
+
+impl From<anyhow::Error> for Error {
+    #[track_caller]
+    fn from(error: anyhow::Error) -> Self {
+        let location = panic::Location::caller();
+        Error {
+            cause: Some(error),
+            file: location.file(),
+            line: location.line(),
+            ..Default::default()
+        }
+    }
+}
+
+impl Error {
+    /// Create a new error, prepending `msg` to the
+    /// description of `cause`
+    #[track_caller]
+    pub fn with_error<E: std::error::Error + Send + Sync + 'static>(msg: &'static str, cause: E) -> Self {
+        let location = panic::Location::caller();
+        Error {
+            msg: Some(Cow::Borrowed(msg)),
+            cause: Some(cause.into()),
+            file: location.file(),
+            line: location.line(),
+        }
+    }
+
+    /// Consume a result, returning false if it is an error and
+    /// true if it is successful.  The error is propagated into
+    /// `errp` like the C API `error_propagate` would do.
+    ///
+    /// # Safety
+    ///
+    /// `errp` must be valid; typically it is received from C code
+    pub unsafe fn bool_or_propagate(result: Result<()>, errp: *mut *mut bindings::Error) -> bool {
+        // SAFETY: caller guarantees errp is valid
+        unsafe { Self::ok_or_propagate(result, errp) }.is_some()
+    }
+
+    /// Consume a result, returning a `NULL` pointer if it is an
+    /// error and a C representation of the contents if it is
+    /// successful.  The error is propagated into `errp` like
+    /// the C API `error_propagate` would do.
+    ///
+    /// # Safety
+    ///
+    /// `errp` must be valid; typically it is received from C code
+    #[must_use]
+    pub unsafe fn ptr_or_propagate<T: CloneToForeign>(
+        result: Result<T>,
+        errp: *mut *mut bindings::Error,
+    ) -> *mut T::Foreign {
+        // SAFETY: caller guarantees errp is valid
+        unsafe { Self::ok_or_propagate(result, errp) }.clone_to_foreign_ptr()
+    }
+
+    /// Consume a result in the same way as `self.ok()`, but also propagate
+    /// a possible error into `errp`, like the C API `error_propagate`
+    /// would do.
+    ///
+    /// # Safety
+    ///
+    /// `errp` must be valid; typically it is received from C code
+    pub unsafe fn ok_or_propagate<T>(
+        result: Result<T>,
+        errp: *mut *mut bindings::Error,
+    ) -> Option<T> {
+        let Err(err) = result else {
+            return result.ok();
+        };
+
+        // SAFETY: caller guarantees errp is valid
+        unsafe {
+            err.propagate(errp);
+        }
+        None
+    }
+
+    /// Equivalent of the C function `error_propagate`.  Fill `*errp`
+    /// with the information container in `result` if `errp` is not NULL;
+    /// then consume it.
+    ///
+    /// # Safety
+    ///
+    /// `errp` must be valid; typically it is received from C code
+    pub unsafe fn propagate(self, errp: *mut *mut bindings::Error) {
+        if errp.is_null() {
+            return;
+        }
+
+        let err = self.clone_to_foreign_ptr();
+
+        // SAFETY: caller guarantees errp is valid
+        unsafe {
+            errp.write(err);
+        }
+    }
+
+    /// Convert a C `Error*` into a Rust `Result`, using
+    /// `Ok(())` if `c_error` is NULL.
+    ///
+    /// # Safety
+    ///
+    /// `c_error` must be valid; typically it has been filled by a C
+    /// function.
+    pub unsafe fn err_or_unit(c_error: *mut bindings::Error) -> Result<()> {
+        // SAFETY: caller guarantees c_error is valid
+        unsafe { Self::err_or_else(c_error, || ()) }
+    }
+
+    /// Convert a C `Error*` into a Rust `Result`, calling `f()` to
+    /// obtain an `Ok` value if `c_error` is NULL.
+    ///
+    /// # Safety
+    ///
+    /// `c_error` must be valid; typically it has been filled by a C
+    /// function.
+    pub unsafe fn err_or_else<T, F: FnOnce() -> T>(
+        c_error: *mut bindings::Error,
+        f: F,
+    ) -> Result<T> {
+        // SAFETY: caller guarantees c_error is valid
+        let err = unsafe { Option::<Self>::from_foreign(c_error) };
+        match err {
+            None => Ok(f()),
+            Some(err) => Err(err),
+        }
+    }
+}
+
+impl FreeForeign for Error {
+    type Foreign = bindings::Error;
+
+    unsafe fn free_foreign(p: *mut bindings::Error) {
+        // SAFETY: caller guarantees p is valid
+        unsafe {
+            error_free(p);
+        }
+    }
+}
+
+impl CloneToForeign for Error {
+    fn clone_to_foreign(&self) -> OwnedPointer<Self> {
+        // SAFETY: all arguments are controlled by this function
+        unsafe {
+            let err: *mut c_void = libc::malloc(std::mem::size_of::<bindings::Error>());
+            let err: &mut bindings::Error = &mut *err.cast();
+            *err = bindings::Error {
+                msg: format!("{self}").clone_to_foreign_ptr(),
+                err_class: bindings::ERROR_CLASS_GENERIC_ERROR,
+                src_len: self.file.len() as isize,
+                src: self.file.as_ptr().cast::<c_char>(),
+                line: self.line as c_int,
+                func: ptr::null_mut(),
+                hint: ptr::null_mut(),
+            };
+            OwnedPointer::new(err)
+        }
+    }
+}
+
+impl FromForeign for Error {
+    unsafe fn cloned_from_foreign(c_error: *const bindings::Error) -> Self {
+        // SAFETY: caller guarantees c_error is valid
+        unsafe {
+            let error = &*c_error;
+            let file = if error.src_len < 0 {
+                // NUL-terminated
+                CStr::from_ptr(error.src).to_str()
+            } else {
+                // Can become str::from_utf8 with Rust 1.87.0
+                std::str::from_utf8(std::slice::from_raw_parts(
+                    &*error.src.cast::<u8>(),
+                    error.src_len as usize,
+                ))
+            };
+
+            Error {
+                msg: FromForeign::cloned_from_foreign(error_get_pretty(error)),
+                cause: None,
+                file: file.unwrap(),
+                line: error.line as u32,
+            }
+        }
+    }
+}
diff --git a/rust/qemu-api/src/lib.rs b/rust/qemu-api/src/lib.rs
index 234a94e3c29..93902fc94bc 100644
--- a/rust/qemu-api/src/lib.rs
+++ b/rust/qemu-api/src/lib.rs
@@ -19,6 +19,7 @@
 pub mod cell;
 pub mod chardev;
 pub mod errno;
+pub mod error;
 pub mod irq;
 pub mod memory;
 pub mod module;
@@ -34,6 +35,8 @@
     ffi::c_void,
 };
 
+pub use error::{Error, Result};
+
 #[cfg(HAVE_GLIB_WITH_ALIGNED_ALLOC)]
 extern "C" {
     fn g_aligned_alloc0(
-- 
2.49.0


