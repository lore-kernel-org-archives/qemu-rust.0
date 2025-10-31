Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE04ACCF9FE
	for <qemu-rust@archiver.kernel.org>; Fri, 31 Oct 2025 15:26:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vEr11-0001Ae-Mo; Fri, 31 Oct 2025 11:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vEr10-00019w-FH
 for qemu-rust@nongnu.org; Fri, 31 Oct 2025 11:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vEr0n-0000oK-2i
 for qemu-rust@nongnu.org; Fri, 31 Oct 2025 11:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761924352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWOdxSuJQXd9jwTAwyQvGMryTPeaJlfg/6hUIbTKrr8=;
 b=aHUl6hK0J1dpIiLhit3E/8QLj3dDrgQNiUFTfFymJUA7iit3LXX6PcX3D6mwhZuaHEeHUV
 FxVePTyreYYhFRTyf2+Wbhfs0lFMyWBb5CZJIewWZAcB/+5fJTQ08o10sr7SAUGaP+gkQO
 sjctDHnmonffcTltzMEsQxsCFROn6HA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-YaDMmrRqMyynXhHyhfrGzQ-1; Fri, 31 Oct 2025 11:25:51 -0400
X-MC-Unique: YaDMmrRqMyynXhHyhfrGzQ-1
X-Mimecast-MFC-AGG-ID: YaDMmrRqMyynXhHyhfrGzQ_1761924350
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4770e0910e4so16164895e9.0
 for <qemu-rust@nongnu.org>; Fri, 31 Oct 2025 08:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761924349; x=1762529149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XWOdxSuJQXd9jwTAwyQvGMryTPeaJlfg/6hUIbTKrr8=;
 b=HV/zMdJln8heWbxioNcB9HQ1UDPK7JWEcBJzCFvGgI4wfnu4I1Ha1Jw/Wj7Gmd8UiE
 mASSK0AiqIFfhvLaFDsnC41v002NtmlE+IbqvZ0nb5bya5a0jaJqqGtcm79nnOoq/HgY
 TZzmxzToQepQH9N24RMO1BP1mQzdmLwBeuXBkSYHUHl06NN+9vl0rIN7XqtequXFnOyq
 GeLsZ6Nj5ZkvANDFSCTwIOd6465V66Vs4EWEntxtD1PbeL47nXXVNEdL6uJfZ9Bldx6J
 t0LDNvZOExXLHZRg0YN6jiIb1cliA9PYyg3M2g/SqzE0Bt+5upTim9xcnIku0hbGKm+O
 PNqQ==
X-Gm-Message-State: AOJu0Yz+2frFn86lLv2Wl+pP0oEamEBDmvNtLgFr+dxtfZNMwZZFc0Bm
 skfDhoPnZ5gO2YaC5ahoiY3u6vxQSSm2KR8mAJY/GdbqxJfE778APK83oViME3P2MOY7qOKouoy
 2OxKZwDiRzi6yErM7x577afthedZhE8h8jNt1+78tK5hbSeiCWjubMq/HHx2djfM=
X-Gm-Gg: ASbGnctXWMHiq+E3NrQvLh5jmabWmJB+QwVxxFsAUTAJSSKrjk8MRMt4ghtkMsJCg4y
 o5/0qqesIsJqMkxjMwXBjVRW7OVSB4iymlNzKZ8vj8kYV57jEdyLA2LVqQ2LFEQOykUTrXrllXe
 cr3KHNRUIIvQeYhn/kHryhGodEGZ2ZPyQfOOToB98NGFDdiqQ6TPhOlY9cYbLrsopA+bQPTOUjE
 DW2C1M2GiG8S1PTLUGO+yN+6pVSUaPmRm4r5q43E8tJFsx6d09IvCZ8iR8enX2LnCtLDfLsFF31
 gQViqxOIKYy4Xez5qPBjgO7WqTQrc782Dzqm78olc0owyITxAL/1az3dfNj7wqWbN0WW3l4imEb
 I1OUYdzjiSeDd/kjWLCmhV/UnvsxH2Bv1Vkty7yi9U9SDJ29io8VPL5Nmh05nLtnzn/CX4gNjLd
 sE+5Vm
X-Received: by 2002:a05:600c:530f:b0:477:1bb6:17de with SMTP id
 5b1f17b1804b1-477308be7a8mr38543915e9.30.1761924349338; 
 Fri, 31 Oct 2025 08:25:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbfH1Ib1RMX6MlVQQ2pbfK8DgAS7484UnHe8O958VBsgNQ4OSTKnM93Eogb5CR+yfxi/+yaw==
X-Received: by 2002:a05:600c:530f:b0:477:1bb6:17de with SMTP id
 5b1f17b1804b1-477308be7a8mr38543595e9.30.1761924348734; 
 Fri, 31 Oct 2025 08:25:48 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.110.222])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c48daa0sm2089525e9.3.2025.10.31.08.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 08:25:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 2/4] rust/util: use anyhow's native chaining capabilities
Date: Fri, 31 Oct 2025 16:25:37 +0100
Message-ID: <20251031152540.293293-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251031152540.293293-1-pbonzini@redhat.com>
References: <20251031152540.293293-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WFu2ZvE-Jj44zldewAIXGxNEAdirXkAj-EhPH034vvQ_1761924350
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

This simplifies conversions, making it possible to convert any error
into a QEMU util::Error with ".into()" (and therefore with "?").

The cost is having a separate constructor for when the error is a simple
string, but that is made easier by the ensure! macro.  If necessary,
another macro similar to "anyhow!" can be returned, but for now there
is no need for that.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/util/src/error.rs | 160 +++++++++++++++--------------------------
 1 file changed, 59 insertions(+), 101 deletions(-)

diff --git a/rust/util/src/error.rs b/rust/util/src/error.rs
index 2a57c7fd5fd..11b574ca593 100644
--- a/rust/util/src/error.rs
+++ b/rust/util/src/error.rs
@@ -38,6 +38,7 @@
     borrow::Cow,
     ffi::{c_char, c_int, c_void, CStr},
     fmt::{self, Display},
+    ops::Deref,
     panic, ptr,
 };
 
@@ -49,118 +50,85 @@
 
 #[derive(Debug)]
 pub struct Error {
-    msg: Option<Cow<'static, str>>,
-    /// Appends the print string of the error to the msg if not None
-    cause: Option<anyhow::Error>,
+    cause: anyhow::Error,
     file: &'static str,
     line: u32,
 }
 
-impl std::error::Error for Error {
-    fn source(&self) -> Option<&(dyn std::error::Error + 'static)> {
-        self.cause.as_ref().map(AsRef::as_ref)
-    }
+impl Deref for Error {
+    type Target = anyhow::Error;
 
-    #[allow(deprecated)]
-    fn description(&self) -> &str {
-        self.msg
-            .as_deref()
-            .or_else(|| self.cause.as_deref().map(std::error::Error::description))
-            .expect("no message nor cause?")
+    fn deref(&self) -> &Self::Target {
+        &self.cause
     }
 }
 
 impl Display for Error {
     fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
-        let mut prefix = "";
-        if let Some(ref msg) = self.msg {
-            write!(f, "{msg}")?;
-            prefix = ": ";
-        }
-        if let Some(ref cause) = self.cause {
-            write!(f, "{prefix}{cause}")?;
-        } else if prefix.is_empty() {
-            panic!("no message nor cause?");
-        }
-        Ok(())
+        Display::fmt(&format_args!("{:#}", self.cause), f)
     }
 }
 
-impl From<Cow<'static, str>> for Error {
+impl<E> From<E> for Error
+where
+    anyhow::Error: From<E>,
+{
     #[track_caller]
-    fn from(msg: Cow<'static, str>) -> Self {
-        let location = panic::Location::caller();
-        Error {
-            msg: Some(msg),
-            cause: None,
-            file: location.file(),
-            line: location.line(),
-        }
-    }
-}
-
-impl From<String> for Error {
-    #[track_caller]
-    fn from(msg: String) -> Self {
-        let location = panic::Location::caller();
-        Error {
-            msg: Some(Cow::Owned(msg)),
-            cause: None,
-            file: location.file(),
-            line: location.line(),
-        }
-    }
-}
-
-impl From<&'static str> for Error {
-    #[track_caller]
-    fn from(msg: &'static str) -> Self {
-        let location = panic::Location::caller();
-        Error {
-            msg: Some(Cow::Borrowed(msg)),
-            cause: None,
-            file: location.file(),
-            line: location.line(),
-        }
-    }
-}
-
-impl From<anyhow::Error> for Error {
-    #[track_caller]
-    fn from(error: anyhow::Error) -> Self {
-        let location = panic::Location::caller();
-        Error {
-            msg: None,
-            cause: Some(error),
-            file: location.file(),
-            line: location.line(),
-        }
+    fn from(src: E) -> Self {
+        Self::new(anyhow::Error::from(src))
     }
 }
 
 impl Error {
+    /// Create a new error from an [`anyhow::Error`].
+    ///
+    /// This wraps the error with QEMU's location tracking information.
+    /// Most code should use the `?` operator instead of calling this directly.
+    #[track_caller]
+    pub fn new(cause: anyhow::Error) -> Self {
+        let location = panic::Location::caller();
+        Self {
+            cause,
+            file: location.file(),
+            line: location.line(),
+        }
+    }
+
+    /// Create a new error from a string message.
+    ///
+    /// This is a convenience wrapper around [`Error::new`] for simple string
+    /// errors. Most code should use the [`ensure!`](crate::ensure) macro
+    /// instead of calling this directly.
+    #[track_caller]
+    pub fn msg(src: impl Into<Cow<'static, str>>) -> Self {
+        Self::new(anyhow::Error::msg(src.into()))
+    }
+
     #[track_caller]
     #[doc(hidden)]
+    #[inline(always)]
     pub fn format(args: fmt::Arguments) -> Self {
-        if let Some(msg) = args.as_str() {
-            Self::from(msg)
-        } else {
-            let msg = fmt::format(args);
-            Self::from(msg)
-        }
+        // anyhow::Error::msg will allocate anyway, might as well let fmt::format doit.
+        let msg = fmt::format(args);
+        Self::new(anyhow::Error::msg(msg))
     }
 
     /// Create a new error, prepending `msg` to the
     /// description of `cause`
     #[track_caller]
     pub fn with_error(msg: impl Into<Cow<'static, str>>, cause: impl Into<anyhow::Error>) -> Self {
-        let location = panic::Location::caller();
-        Error {
-            msg: Some(msg.into()),
-            cause: Some(cause.into()),
-            file: location.file(),
-            line: location.line(),
+        fn do_with_error(
+            msg: Cow<'static, str>,
+            cause: anyhow::Error,
+            location: &'static panic::Location<'static>,
+        ) -> Error {
+            Error {
+                cause: cause.context(msg),
+                file: location.file(),
+                line: location.line(),
+            }
         }
+        do_with_error(msg.into(), cause.into(), panic::Location::caller())
     }
 
     /// Consume a result, returning `false` if it is an error and
@@ -326,8 +294,7 @@ unsafe fn cloned_from_foreign(c_error: *const bindings::Error) -> Self {
             };
 
             Error {
-                msg: FromForeign::cloned_from_foreign(error.msg),
-                cause: None,
+                cause: anyhow::Error::msg(String::cloned_from_foreign(error.msg)),
                 file: file.unwrap(),
                 line: error.line as u32,
             }
@@ -376,8 +343,8 @@ macro_rules! ensure {
     };
     ($cond:expr, $err:expr $(,)?) => {
         if !$cond {
-            let s = ::std::borrow::Cow::<'static, str>::from($err);
-            return $crate::Result::Err(s.into());
+            let e = $crate::Error::msg($err);
+            return $crate::Result::Err(e);
         }
     };
 }
@@ -416,19 +383,10 @@ unsafe fn error_get_pretty<'a>(local_err: *mut bindings::Error) -> &'a CStr {
         unsafe { CStr::from_ptr(bindings::error_get_pretty(local_err)) }
     }
 
-    #[test]
-    #[allow(deprecated)]
-    fn test_description() {
-        use std::error::Error;
-
-        assert_eq!(super::Error::from("msg").description(), "msg");
-        assert_eq!(super::Error::from("msg".to_owned()).description(), "msg");
-    }
-
     #[test]
     fn test_display() {
-        assert_eq!(&*format!("{}", Error::from("msg")), "msg");
-        assert_eq!(&*format!("{}", Error::from("msg".to_owned())), "msg");
+        assert_eq!(&*format!("{}", Error::msg("msg")), "msg");
+        assert_eq!(&*format!("{}", Error::msg("msg".to_owned())), "msg");
         assert_eq!(&*format!("{}", Error::from(anyhow!("msg"))), "msg");
 
         assert_eq!(
@@ -445,7 +403,7 @@ fn test_bool_or_propagate() {
             assert!(Error::bool_or_propagate(Ok(()), &mut local_err));
             assert_eq!(local_err, ptr::null_mut());
 
-            let my_err = Error::from("msg");
+            let my_err = Error::msg("msg");
             assert!(!Error::bool_or_propagate(Err(my_err), &mut local_err));
             assert_ne!(local_err, ptr::null_mut());
             assert_eq!(error_get_pretty(local_err), c"msg");
@@ -462,7 +420,7 @@ fn test_ptr_or_propagate() {
             assert_eq!(String::from_foreign(ret), "abc");
             assert_eq!(local_err, ptr::null_mut());
 
-            let my_err = Error::from("msg");
+            let my_err = Error::msg("msg");
             assert_eq!(
                 Error::ptr_or_propagate(Err::<String, _>(my_err), &mut local_err),
                 ptr::null_mut()
-- 
2.51.1


