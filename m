Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C562ED185F1
	for <qemu-rust@archiver.kernel.org>; Thu,  8 Jan 2026 13:12:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vdpnH-0007ct-Vy; Thu, 08 Jan 2026 08:11:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpnG-0007c1-H7
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpnE-00080p-Bi
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767877870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b03v/X6J7oomQaGRutqWEu7f8gmtoiSOE8nhF1tA+Qc=;
 b=KuvWLqBsCY6QKPzWsvzZFqVkv7t9nh2ApT7lxl6kdhnB7jZDp0sGgfvNJjMQNq2WFO/FHz
 V25vbNyF6GrNMg1ZNwm6g7JiNf4cNwKzMZEBXnVlKOOZxEnfLykt5nu8UQEvFDBAIHxQMH
 ZJCLtxhimyF0QJqJSgzYOWFCKYlyvCQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-tGrUdQxvNWKDo21bK-tl4Q-1; Thu, 08 Jan 2026 08:11:09 -0500
X-MC-Unique: tGrUdQxvNWKDo21bK-tl4Q-1
X-Mimecast-MFC-AGG-ID: tGrUdQxvNWKDo21bK-tl4Q_1767877869
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477771366cbso27321395e9.0
 for <qemu-rust@nongnu.org>; Thu, 08 Jan 2026 05:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767877868; x=1768482668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b03v/X6J7oomQaGRutqWEu7f8gmtoiSOE8nhF1tA+Qc=;
 b=TNGGtvYwWcnZ6ludsJwEeZKIgQvssThpllpIDql1yFdXM2maKStpecoe5aCktTif1k
 A75ZzsAZ+uSsrZQggYIvycOi38kfgIVNalYK/2jIG9YW9EiNm2g1IgLNxH8oxOKPlcJ2
 jIK3t6dR6xkmonNF1AS3XbDfLPXPbFUt8Aa9kLU2Dp5fLmKwwS/zH+Gui2nJnoXqtuzU
 T1GBkag1rDTNz/JgEsGp4J2UVfWn1f8J01DYTateWTKImoMhMlyLQIJrisX9OEFRrBFc
 l3ckDtUAn/N3tLYtDq1jieWum9Ux2A+hrfb4N1RiiFH3p2c2sPiQoHZolRopHXvvpohI
 73Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnEcCUbCLF9H0N+bOnVCuK10btX57CxrIfNOd9Wd9hBXb+BsRfBNP/72sfYAFCDtsRjp78JqGTW9U=@nongnu.org
X-Gm-Message-State: AOJu0Yxs+wdDufSk/MtP3Ndv/p4TombD/PlrzLZFntPeAEvAYSO91TtH
 KheVP8yt2DF7rKQe14w+htWWBIaLyuN2F76XPznuA22K5600cO1xkXQUR4eety/gOasVLVRtSAa
 zDdz5BHW7QzHnyYEq73/KcOk7w88iKRPf2rtOnuvsTDkfahwx8PPAGRc=
X-Gm-Gg: AY/fxX5SNAxvjtlXmhXXqMcCtp+/QrhJfPd4Lv5b+NLutfktKAD8MFL9UG3KvH+CPL3
 O1WmtXeS5tvn92AlF25I2JcgFpsXo77zUKWrJtzMJBiy2X29MPdyZWBDtKvJ/WjYforgR03Twey
 4eIuxdtCOdiIuMmeVu+PNEWRC+qEghNAywAUk6Ef/LnbCNiPDnQP+lv2rUefTkRiJDyl8eWDGH9
 gD/yLtsLz7/+v2v0dJArzZnoqjL3cSxxEWU9qiZBRg2GNXBx5vYPJWEu5Ho6Q0aJZ+q87NZFhgc
 daE+g5SCgx9gX+Ne57x1tYUYAi34eeTf9aJTZNfRuOZCYf/Qm+acqJ7d1wl6KwCMKJ/vpOhJDkx
 LJq01ns97KN49UuYHw1EdDm8CltigkOqYKfO2/Haev+WN+mUyWy/nXgsNrSuJ4xxrqq2QGxdQ/X
 MjmBU/liDMDKmxfQ==
X-Received: by 2002:a05:600c:444c:b0:477:9f34:17b8 with SMTP id
 5b1f17b1804b1-47d84b0a9e5mr75664105e9.1.1767877868517; 
 Thu, 08 Jan 2026 05:11:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgeAw6U45pzrqLZ+eF+lmM3Y5HhM8mwGDLIgKhDNBeRWq37Htljn5SujciM9nPWOyXkRNf2g==
X-Received: by 2002:a05:600c:444c:b0:477:9f34:17b8 with SMTP id
 5b1f17b1804b1-47d84b0a9e5mr75663875e9.1.1767877868110; 
 Thu, 08 Jan 2026 05:11:08 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f410c6csm163472975e9.1.2026.01.08.05.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:11:05 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-rust@nongnu.org
Subject: [PATCH v2 08/16] rust/qobject: add Display/Debug
Date: Thu,  8 Jan 2026 14:10:35 +0100
Message-ID: <20260108131043.490084-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108131043.490084-1-pbonzini@redhat.com>
References: <20260108131043.490084-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -DD1YT9GWDtOSCVfqgfpJAxn9IeEKr07jDzIDPB8Teg_1767877869
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/util/src/qobject/mod.rs | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/rust/util/src/qobject/mod.rs b/rust/util/src/qobject/mod.rs
index 95d41cec4f1..8033b5fafa0 100644
--- a/rust/util/src/qobject/mod.rs
+++ b/rust/util/src/qobject/mod.rs
@@ -12,6 +12,7 @@
 mod serialize;
 mod serializer;
 
+use core::fmt::{self, Debug, Display};
 use std::{
     cell::UnsafeCell,
     ffi::{c_char, CString},
@@ -270,6 +271,33 @@ fn drop(&mut self) {
     }
 }
 
+impl Display for QObject {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        // replace with a plain serializer?
+        match_qobject! { (self) =>
+            () => write!(f, "QNull"),
+            bool(b) => write!(f, "QBool({})", if b { "true" } else { "false" }),
+            i64(n) => write!(f, "QNumI64({})", n),
+            u64(n) => write!(f, "QNumU64({})", n),
+            f64(n) => write!(f, "QNumDouble({})", n),
+            CStr(s) => write!(f, "QString({})", s.to_str().unwrap_or("bad CStr")),
+            QList(_) => write!(f, "QList"),
+            QDict(_) => write!(f, "QDict"),
+        }
+    }
+}
+
+impl Debug for QObject {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        let val = self.to_string();
+        f.debug_struct("QObject")
+            .field("ptr", &self.0.get())
+            .field("refcnt()", &self.refcnt())
+            .field("to_string()", &val)
+            .finish()
+    }
+}
+
 macro_rules! match_qobject {
     (@internal ($qobj:expr) =>
         $(() => $unit:expr,)?
-- 
2.52.0


