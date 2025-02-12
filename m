Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ti9E3-0007dP-79
	for mharc-qemu-rust@gnu.org; Wed, 12 Feb 2025 04:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ti9E0-0007cW-LU
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 04:40:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ti9Dy-0003dG-I0
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 04:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739353204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DIc16RuNKHqnb4eNV5jxK4gemlzvg6qVFe3KxHsO0ro=;
 b=Z1F03WRccM33tfpXozygzq58e/zA8vfRci/WkyoZnfvj+fPcCN0035PbReu3NRyg5kcnju
 N9FrWsDa8Nf8nko4iDf5oRG4c2qLVDVLTSL5jGELpBP7CGIHgKE5L3b0umGqAAzDSn4PTa
 4JvVoSFtcmmGkeqEO4gBzKI3JYHqJeg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-we_SJZQwNTCBWikaf2nMLw-1; Wed, 12 Feb 2025 04:40:03 -0500
X-MC-Unique: we_SJZQwNTCBWikaf2nMLw-1
X-Mimecast-MFC-AGG-ID: we_SJZQwNTCBWikaf2nMLw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43935bcec79so17947715e9.3
 for <qemu-rust@nongnu.org>; Wed, 12 Feb 2025 01:40:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739353201; x=1739958001;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DIc16RuNKHqnb4eNV5jxK4gemlzvg6qVFe3KxHsO0ro=;
 b=utUlKpVUPfCykrfhYHmUoN9ZVJ++OgPEjihuC0EP7dTaSugvaAluwUUsJLv3uhguVa
 nPNjCMv0G6K5P6qTkZFxc8Gk3mYheEfGMG3t6OqtHy+YcCNpUR+1v+wJa4pRIerhiURN
 ezd+omSYAudcCJmAkcjQGLGSwzLpUJV/BIWjgDIRshpoDihEWIhqDoh+aG9LGZHW4bT9
 dmHx+r0tK9ZZkyRVDi4ZY9xSGLED+rPKZde3cszqDm1HY2bsL+Kcmh5stCNC27VE87yx
 HiVBg1V14F9AdrE62lQf9hHlo0nyGgGvzoLibfdY5HK5qpYoj6FVsA5G7h8bzcVYczB4
 TMUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqSilsJQKMSMG278FkCp8saULnItEGQiSA8j2t4bAAt/D8VSXmTB7AY2s4/BUFmBU/7LgZHNBstak=@nongnu.org
X-Gm-Message-State: AOJu0Yy5PYntDMyRE0ou3sux9w1HiY/YW86nybaoWLMSwjT0r4Vpo6dG
 v+8s4Wb4dlKZVeICYA1cgopxhNENZL+GYKIwLySDiqySIW+LEAF6DJ5DLYMeR0XeLziDf6k80Ha
 HwUS3KhDS0ggyTeasUcqL1nR22QcBEgfdp2A3mRDMe5euRhpnkieRSqlPyKyIwA==
X-Gm-Gg: ASbGncuVUSRatrZes2imF/ruN8ZWeCQyA4RRrc8fCZQM/Q5K06w/zpotTU3i4KzOwh0
 OoAQtNBBTvatASdyb4/ToRHsLIeKDFIHvNRGFqqVs+Rs9rUEiLOkbbzY83ky0AZN9vYnMzNfed9
 /7eHC5BMru3W5pkNMCFy543HXHeBkPgZzgarapPCmy2VPe4P1PBZIGlwINxT3e8yopJPusllodB
 tPLqhoWm4sstGuI2Mgv0PHVnX4miSIxf694fa3AKZ4VAL2AmZaS0YRAFs50j3clj7rGsP5T69A1
 crOUgRA=
X-Received: by 2002:a05:600c:1c18:b0:439:4b9e:461b with SMTP id
 5b1f17b1804b1-43958188f82mr23834415e9.14.1739353200806; 
 Wed, 12 Feb 2025 01:40:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvvPVD2RixaRG3xr5Lw6fzWeva8V4FMB1eLV7B1Q3iVak8fcCko4RAD0SXDlpuGKEHXQ6+Ug==
X-Received: by 2002:a05:600c:1c18:b0:439:4b9e:461b with SMTP id
 5b1f17b1804b1-43958188f82mr23834105e9.14.1739353200289; 
 Wed, 12 Feb 2025 01:40:00 -0800 (PST)
Received: from [192.168.10.48] ([151.95.148.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f8a2sm14242475e9.2.2025.02.12.01.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 01:39:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH] rust: add module to convert -errno to io::Error
Date: Wed, 12 Feb 2025 10:39:58 +0100
Message-ID: <20250212093958.3703269-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uZrjzz8m8O6QQMwyQ62U1i50_xDD_Uvmo8R2BtOh4OU_1739353202
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Wed, 12 Feb 2025 09:40:09 -0000

This is an initial, minimal part of the chardev bindings.  It is a
common convention in QEMU to return a positive value in case of success,
and a negated errno value in case of error.  Unfortunately, using errno
portably in Rust is a bit complicated; on Unix the errno values are
supported natively by io::Error, but on Windows they are not and one would
have to use the libc crate.  Provide a small module that interprets QEMU's
convention and does a best-effort translation to io::Error on Windows.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/meson.build       |   1 +
 rust/qemu-api/src/assertions.rs |  28 ++++++
 rust/qemu-api/src/errno.rs      | 161 ++++++++++++++++++++++++++++++++
 rust/qemu-api/src/lib.rs        |   1 +
 rust/qemu-api/src/prelude.rs    |   2 +
 5 files changed, 193 insertions(+)
 create mode 100644 rust/qemu-api/src/errno.rs

diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index 26b8500e7d8..607c3010d1d 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -22,6 +22,7 @@ _qemu_api_rs = static_library(
       'src/cell.rs',
       'src/chardev.rs',
       'src/c_str.rs',
+      'src/errno.rs',
       'src/irq.rs',
       'src/memory.rs',
       'src/module.rs',
diff --git a/rust/qemu-api/src/assertions.rs b/rust/qemu-api/src/assertions.rs
index fa1a18de6fe..104dec39774 100644
--- a/rust/qemu-api/src/assertions.rs
+++ b/rust/qemu-api/src/assertions.rs
@@ -92,3 +92,31 @@ fn types_must_be_equal<T, U>(_: T)
         };
     };
 }
+
+/// Assert that an expression matches a pattern.  This can also be
+/// useful to compare enums that do not implement `Eq`.
+///
+/// # Examples
+///
+/// ```
+/// # use qemu_api::assert_match;
+/// // JoinHandle does not implement `Eq`, therefore the result
+/// // does not either.
+/// let result: Result<std::thread::JoinHandle<()>, u32> = Err(42);
+/// assert_match!(result, Err(42));
+/// ```
+#[macro_export]
+macro_rules! assert_match {
+    ($a:expr, $b:pat) => {
+        assert!(
+            match $a {
+                $b => true,
+                _ => false,
+            },
+            "{} = {:?} does not match {}",
+            stringify!($a),
+            $a,
+            stringify!($b)
+        );
+    };
+}
diff --git a/rust/qemu-api/src/errno.rs b/rust/qemu-api/src/errno.rs
new file mode 100644
index 00000000000..c697f9bef05
--- /dev/null
+++ b/rust/qemu-api/src/errno.rs
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+//! Module to portably convert `errno` into [`io::Error`], and the
+//! return value of functions returning `-errno` into [`io::Result`].
+
+use std::io;
+#[cfg(windows)]
+use std::io::ErrorKind;
+
+/// An `errno` value that can be converted into an [`io::Error`]
+pub struct Errno(u16);
+
+// On Unix, from_raw_os_error takes an errno value and OS errors
+// are printed using strerror.  On Windows however it takes a
+// GetLastError() value; therefore we need to convert errno values
+// into io::Error by hand.  For simplicity use ErrorKind and use
+// the standard library's simple-minded mapping of ErrorKind to Error
+// (`impl From<ErrorKind> for io::Error`).
+//
+// Since this is just for Windows, do not bother with using the libc
+// crate or generating the constants from C.  Just list here the
+// constants that map to stable error kinds.
+#[cfg(windows)]
+mod libc {
+    pub const EPERM: u16 = 1;
+    pub const ENOENT: u16 = 2;
+    pub const EINTR: u16 = 4;
+    pub const EAGAIN: u16 = 11;
+    pub const ENOMEM: u16 = 12;
+    pub const EACCES: u16 = 13;
+    pub const EEXIST: u16 = 17;
+    pub const EINVAL: u16 = 22;
+    pub const EPIPE: u16 = 32;
+    pub const EADDRINUSE: u16 = 100;
+    pub const EADDRNOTAVAIL: u16 = 101;
+    pub const ECONNABORTED: u16 = 106;
+    pub const ECONNREFUSED: u16 = 107;
+    pub const ECONNRESET: u16 = 108;
+    pub const ENOTCONN: u16 = 126;
+    pub const ENOTSUP: u16 = 129;
+    pub const ETIMEDOUT: u16 = 138;
+    pub const EWOULDBLOCK: u16 = 140;
+}
+
+impl From<Errno> for io::Error {
+    #[cfg(unix)]
+    fn from(value: Errno) -> io::Error {
+        let Errno(errno) = value;
+        io::Error::from_raw_os_error(errno.into())
+    }
+
+    #[cfg(windows)]
+    fn from(value: Errno) -> io::Error {
+        let Errno(errno) = value;
+        let error_kind = match errno {
+            libc::EPERM | libc::EACCES => ErrorKind::PermissionDenied,
+            libc::ENOENT => ErrorKind::NotFound,
+            libc::EINTR => ErrorKind::Interrupted,
+            // Note that on Windows we know these two are distinct.  In general,
+            // it would not be possible to use "|".
+            libc::EAGAIN | libc::EWOULDBLOCK => ErrorKind::WouldBlock,
+            libc::ENOMEM => ErrorKind::OutOfMemory,
+            libc::EEXIST => ErrorKind::AlreadyExists,
+            libc::EINVAL => ErrorKind::InvalidInput,
+            libc::EPIPE => ErrorKind::BrokenPipe,
+            libc::EADDRINUSE => ErrorKind::AddrInUse,
+            libc::EADDRNOTAVAIL => ErrorKind::AddrNotAvailable,
+            libc::ECONNABORTED => ErrorKind::ConnectionAborted,
+            libc::ECONNREFUSED => ErrorKind::ConnectionRefused,
+            libc::ECONNRESET => ErrorKind::ConnectionReset,
+            libc::ENOTCONN => ErrorKind::NotConnected,
+            libc::ENOTSUP => ErrorKind::Unsupported,
+            libc::ETIMEDOUT => ErrorKind::TimedOut,
+            _ => ErrorKind::Other,
+        };
+        error_kind.into()
+    }
+}
+
+/// Convert an integer value into a [`Result`], where positive
+/// values are turned into an `Ok` result and negative values are
+/// interpreted as negated errno and turned into an `Err`.
+pub trait GetErrno: Copy {
+    /// Unsigned variant of self, used as the type for the `Ok` case.
+    type Out;
+
+    /// Return `Ok(self)` if positive, `Err(Errno(-self))` if negative
+    fn into_errno_result(self) -> Result<Self::Out, Errno>;
+}
+
+macro_rules! get_errno {
+    ($t:ty, $out:ty) => {
+        impl GetErrno for $t {
+            type Out = $out;
+            fn into_errno_result(self) -> Result<Self::Out, Errno> {
+                match self {
+                    0.. => Ok(self as $out),
+                    -65535..=-1 => Err(Errno(-self as u16)),
+                    _ => panic!("{self} is not a negative errno"),
+                }
+            }
+        }
+    };
+}
+
+get_errno!(i32, u32);
+get_errno!(i64, u64);
+get_errno!(isize, usize);
+
+/// Convert an integer value into a [`io::Result`], where positive
+/// values are turned into an `Ok` result and negative values are
+/// interpreted as negated errno and turn into an `Err`.
+///
+/// ```
+/// # use qemu_api::errno::into_io_result;
+/// # use std::io::ErrorKind;
+///
+/// let err = into_io_result(-1i32).unwrap_err(); // -EPERM
+/// assert_eq!(err.kind(), ErrorKind::PermissionDenied);
+/// ```
+pub fn into_io_result<T: GetErrno>(value: T) -> io::Result<T::Out> {
+    Ok(value.into_errno_result()?)
+}
+
+#[cfg(test)]
+mod tests {
+    use std::io::ErrorKind;
+
+    use super::*;
+    use crate::assert_match;
+
+    #[test]
+    pub fn test_i32() {
+        assert_match!(into_io_result(1234i32), Ok(1234));
+
+        let err = into_io_result(-1i32).unwrap_err();
+        #[cfg(unix)]
+        assert_match!(err.raw_os_error(), Some(1));
+        assert_match!(err.kind(), ErrorKind::PermissionDenied);
+    }
+
+    #[test]
+    pub fn test_i64() {
+        assert_match!(into_io_result(1234i64), Ok(1234));
+
+        let err = into_io_result(-22i64).unwrap_err();
+        #[cfg(unix)]
+        assert_match!(err.raw_os_error(), Some(22));
+        assert_match!(err.kind(), ErrorKind::InvalidInput);
+    }
+
+    #[test]
+    pub fn test_isize() {
+        assert_match!(into_io_result(1234isize), Ok(1234));
+
+        let err = into_io_result(-4isize).unwrap_err();
+        #[cfg(unix)]
+        assert_match!(err.raw_os_error(), Some(4));
+        assert_match!(err.kind(), ErrorKind::Interrupted);
+    }
+}
diff --git a/rust/qemu-api/src/lib.rs b/rust/qemu-api/src/lib.rs
index ed1a8f9a2b4..05f38b51d30 100644
--- a/rust/qemu-api/src/lib.rs
+++ b/rust/qemu-api/src/lib.rs
@@ -19,6 +19,7 @@
 pub mod callbacks;
 pub mod cell;
 pub mod chardev;
+pub mod errno;
 pub mod irq;
 pub mod memory;
 pub mod module;
diff --git a/rust/qemu-api/src/prelude.rs b/rust/qemu-api/src/prelude.rs
index fbf0ee23e0b..634acf37a85 100644
--- a/rust/qemu-api/src/prelude.rs
+++ b/rust/qemu-api/src/prelude.rs
@@ -9,6 +9,8 @@
 pub use crate::cell::BqlCell;
 pub use crate::cell::BqlRefCell;
 
+pub use crate::errno;
+
 pub use crate::qdev::DeviceMethods;
 
 pub use crate::qom::InterfaceType;
-- 
2.48.1


