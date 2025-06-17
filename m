Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uRRQf-0003Wf-U1
	for mharc-qemu-rust@gnu.org; Tue, 17 Jun 2025 04:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uRRQe-0003WE-6x
 for qemu-rust@nongnu.org; Tue, 17 Jun 2025 04:12:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uRRQb-0006cS-Uq
 for qemu-rust@nongnu.org; Tue, 17 Jun 2025 04:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750147939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KKsw1tZe4SL8oWhZJYFFC9KNznPhrzfGffjRj4/H/6Y=;
 b=OG9DTUPluZsNhbRhI1ZTptoC9oL8t/tFmZ3Kjp8OyICkpnCT/TkD7KtIhBs3UkydtywONe
 Jll14kIw4VYvEGrGPiafies44VpqR6ILV7EI2wdFVtgf3m8FoOJ3YhRtXNIbmhkXgA/g83
 GBrEQHgRuoYdIQKQevjqGJ3y+DXQcKE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-jUEB50ZgMmOT_U26pYP1rQ-1; Tue, 17 Jun 2025 04:12:18 -0400
X-MC-Unique: jUEB50ZgMmOT_U26pYP1rQ-1
X-Mimecast-MFC-AGG-ID: jUEB50ZgMmOT_U26pYP1rQ_1750147937
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-451ac1b43c4so29988335e9.0
 for <qemu-rust@nongnu.org>; Tue, 17 Jun 2025 01:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750147937; x=1750752737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KKsw1tZe4SL8oWhZJYFFC9KNznPhrzfGffjRj4/H/6Y=;
 b=k+3JJgbcRs9u3xUaS2dQMDmAHrl7ZiSZhLgWRhOrDaA3qD2/4tkdYTUbt8iPACb9Nm
 BhAKkVtfvOX5V1wJTRdSywZQUr+WqUtt9QSgjaLpfdD6f16KTqbF3AGdMPnz/0MaelMB
 X1n/NIrMkTDvdOKiP8002BBWkIkGjxZZEwWjqKul7V8vhmqibHWzMKB72eUfJSR4hGxq
 m6FXF8FfkzFT7+oZKNOvucIx1OOX/0O9/7VQ8GH/kir8cHOWxvKP5fGZi4Rz99Mev1JZ
 WtjeVCwCU1tYEw1SOvVQCiefHx3ECxfvLMEz0R5HSEYaUfs7G0Q+z/uj04OvwmJe8JpF
 +Xtw==
X-Gm-Message-State: AOJu0YywLX3h64EMh78R1JpfTM/srSCJws7EsWBuZC2biBaxyYoUgozL
 aGS/xaF79nT7JzW6M//RJtHeD3E0IqXhnlq94RTW57kj1ICbVNSlN4VsJezXAV8YBwzJk8rG37c
 gxp6lD7gO55whNjGcqAtKguQI+WLxGWcaOHudeOgQ80U3ORHV9vSlhHQ=
X-Gm-Gg: ASbGncuSpKYRGeEioGJj0NKp8WcoXxXALXIkWhbFlWpWVbD01rD0eBogb/5inh05kfq
 VMxau2yEPMIrhNCu9Ot+eZUpd4yxxSzdxwRCVA4PWPo4+NWLX4hxoaBxtLbni9dsno0H0gZSNRf
 PtbrFl5yQtLPqh0vdZPQ0N4JFj97JRKVbB+mVy5gQw3GxPkCDLoCxISz13DSuc8YG7Oos8Us+U8
 LL1jzfkbmLnDPtXaTcBNNdGosVl0kZJOGHASxk3fYZuDsPT8iHBu12HbvkvlpdaK26foU520wA8
 ByyN7IHQ8X5Vcxb/AMkOqZG0MZ4=
X-Received: by 2002:a05:600c:6087:b0:442:e9eb:1b48 with SMTP id
 5b1f17b1804b1-4533caed5b0mr115637645e9.24.1750147936582; 
 Tue, 17 Jun 2025 01:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLjpCVyCTjfSdDjEpXdyn7L8Ekrl/ZiJzxpQ3w+aGn7xFiiLwaOmbC8LxUqHsxu3uFgSzl5w==
X-Received: by 2002:a05:600c:6087:b0:442:e9eb:1b48 with SMTP id
 5b1f17b1804b1-4533caed5b0mr115637405e9.24.1750147936179; 
 Tue, 17 Jun 2025 01:12:16 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.88.147])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e14fc98sm173184845e9.29.2025.06.17.01.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 01:12:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	manos.pitsidianakis@linaro.org,
	shentey@gmail.com
Subject: [PATCH] rust: log: implement io::Write
Date: Tue, 17 Jun 2025 10:12:13 +0200
Message-ID: <20250617081213.115329-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OJf05NXADHv1JAEyZEZ17vSP83NDanJiyfVMNWgLfvM_1750147937
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.892,
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
X-List-Received-Date: Tue, 17 Jun 2025 08:12:24 -0000

This makes it possible to lock the log file; it also makes log_mask_ln!
not allocate memory when logging a constant string.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/log.h       |  2 +
 util/log.c               | 12 ++++++
 rust/qemu-api/src/log.rs | 87 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 93 insertions(+), 8 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 60da703e670..aae72985f0d 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -84,6 +84,8 @@ typedef struct QEMULogItem {
 
 extern const QEMULogItem qemu_log_items[];
 
+ssize_t rust_fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream);
+
 bool qemu_set_log(int log_flags, Error **errp);
 bool qemu_set_log_filename(const char *filename, Error **errp);
 bool qemu_set_log_filename_flags(const char *name, int flags, Error **errp);
diff --git a/util/log.c b/util/log.c
index b87d399e4cb..58d24de48a0 100644
--- a/util/log.c
+++ b/util/log.c
@@ -558,3 +558,15 @@ void qemu_print_log_usage(FILE *f)
     fprintf(f, "\nUse \"-d trace:help\" to get a list of trace events.\n\n");
 #endif
 }
+
+#ifdef CONFIG_HAVE_RUST
+ssize_t rust_fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream)
+{
+    /*
+     * Same as fwrite, but return -errno because Rust libc does not provide
+     * portable access to errno. :(
+     */
+    int ret = fwrite(ptr, size, nmemb, stream);
+    return ret < 0 ? -errno : 0;
+}
+#endif
diff --git a/rust/qemu-api/src/log.rs b/rust/qemu-api/src/log.rs
index d6c3d6c1b63..ef7acd32520 100644
--- a/rust/qemu-api/src/log.rs
+++ b/rust/qemu-api/src/log.rs
@@ -3,6 +3,10 @@
 
 //! Bindings for QEMU's logging infrastructure
 
+use std::{io, ptr::NonNull};
+
+use crate::{bindings, errno};
+
 #[repr(u32)]
 /// Represents specific error categories within QEMU's logging system.
 ///
@@ -11,11 +15,79 @@
 pub enum Log {
     /// Log invalid access caused by the guest.
     /// Corresponds to `LOG_GUEST_ERROR` in the C implementation.
-    GuestError = crate::bindings::LOG_GUEST_ERROR,
+    GuestError = bindings::LOG_GUEST_ERROR,
 
     /// Log guest access of unimplemented functionality.
     /// Corresponds to `LOG_UNIMP` in the C implementation.
-    Unimp = crate::bindings::LOG_UNIMP,
+    Unimp = bindings::LOG_UNIMP,
+}
+
+/// A RAII guard for QEMU's logging infrastructure.  Creating the guard
+/// locks the log file, and dropping it (letting it go out of scope) unlocks
+/// the file.
+///
+/// As long as the guard lives, it can be written to using [`std::io::Write`].
+///
+/// The locking is recursive, therefore owning a guard does not prevent
+/// using [`log_mask_ln!()`](crate::log_mask_ln).
+pub struct LogGuard(NonNull<bindings::FILE>);
+
+impl LogGuard {
+    /// Return a RAII guard that writes to QEMU's logging infrastructure.
+    /// The log file is locked while the guard exists, ensuring that there
+    /// is no tearing of the messages.
+    ///
+    /// Return `None` if the log file is closed and could not be opened.
+    /// Do *not* use `unwrap()` on the result; failure can be handled simply
+    /// by not logging anything.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use qemu_api::log::LogGuard;
+    /// # use std::io::Write;
+    /// if let Some(mut log) = LogGuard::new() {
+    ///     writeln!(log, "test");
+    /// }
+    /// ```
+    pub fn new() -> Option<Self> {
+        let f = unsafe { bindings::qemu_log_trylock() }.cast();
+        NonNull::new(f).map(Self)
+    }
+
+    /// Writes a formatted string into the log, returning any error encountered.
+    ///
+    /// This method is primarily used by the [`log_mask_ln!()`](crate::log_mask_ln)
+    /// macro, and it is rare for it to be called explicitly.
+    pub fn log_fmt(args: std::fmt::Arguments) -> io::Result<()> {
+        if let Some(mut log) = Self::new() {
+            use io::Write;
+            log.write_fmt(args)?;
+        }
+        Ok(())
+    }
+}
+
+impl io::Write for LogGuard {
+    fn write(&mut self, bytes: &[u8]) -> io::Result<usize> {
+        let ret = unsafe {
+            bindings::rust_fwrite(bytes.as_ptr().cast(), 1, bytes.len(), self.0.as_ptr())
+        };
+        errno::into_io_result(ret)
+    }
+
+    fn flush(&mut self) -> io::Result<()> {
+        // Do nothing, dropping the guard takes care of flushing
+        Ok(())
+    }
+}
+
+impl Drop for LogGuard {
+    fn drop(&mut self) {
+        unsafe {
+            bindings::qemu_log_unlock(self.0.as_ptr());
+        }
+    }
 }
 
 /// A macro to log messages conditionally based on a provided mask.
@@ -24,6 +96,8 @@ pub enum Log {
 /// log level and, if so, formats and logs the message. It is the Rust
 /// counterpart of the `qemu_log_mask()` macro in the C implementation.
 ///
+/// Errors from writing to the log are ignored.
+///
 /// # Parameters
 ///
 /// - `$mask`: A log level mask. This should be a variant of the `Log` enum.
@@ -62,12 +136,9 @@ macro_rules! log_mask_ln {
         if unsafe {
             (::qemu_api::bindings::qemu_loglevel & ($mask as std::os::raw::c_int)) != 0
         } {
-            let formatted_string = format!("{}\n", format_args!($fmt $($args)*));
-            let c_string = std::ffi::CString::new(formatted_string).unwrap();
-
-            unsafe {
-                ::qemu_api::bindings::qemu_log(c_string.as_ptr());
-            }
+            #[allow(unused_must_use)]
+            ::qemu_api::log::LogGuard::log_fmt(
+                format_args!("{}\n", format_args!($fmt $($args)*)));
         }
     }};
 }
-- 
2.49.0


