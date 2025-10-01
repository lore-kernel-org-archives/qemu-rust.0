Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78890CAC5BB
	for <qemu-rust@archiver.kernel.org>; Wed,  1 Oct 2025 08:06:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3rmZ-0005pA-T1; Wed, 01 Oct 2025 04:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rmP-0005kQ-Jd
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rm5-00065C-I5
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759305676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sLvWPDiZQluuX0FdQeBQRWyJsw3tgbSgeYh0RBC+6e8=;
 b=diHEaV3Mb55NAECEMQcyllfom9xEyyXJHZRSeC+BYOM0h/7bxGygjGd2ngUYmONqDdNO9y
 ki9JUQZfRV/8pxhpJ4cs3le72ajF+cEb8gtw0SAwec80AVhdPmrMonjsIUSkRjmIPGTkcZ
 qjeNNmZVMr+dgVTLsYy/9qZ8xnCUPgE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-E1ffcrE9N0eK9C334otQJg-1; Wed, 01 Oct 2025 04:01:15 -0400
X-MC-Unique: E1ffcrE9N0eK9C334otQJg-1
X-Mimecast-MFC-AGG-ID: E1ffcrE9N0eK9C334otQJg_1759305674
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-634cdb5d528so711758a12.1
 for <qemu-rust@nongnu.org>; Wed, 01 Oct 2025 01:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759305673; x=1759910473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sLvWPDiZQluuX0FdQeBQRWyJsw3tgbSgeYh0RBC+6e8=;
 b=lzhUQKFpFMJRzQnvZt1UvuHx7C679TAeIVF4wqK0uXOXs2G8YEhXPuCPbDVWQkSjm1
 UIoVuVI4/TQI6XgAa6qn2IFVbOhnHmhLtcm21ME8xpOjBDlkMvUwXx7hCFm3VU8JIbCJ
 KL4UDIfgyEFh1gg5GqtLbJASJ7ocgKYdk9p3tUDSPORb+vIokbxAUwV3XKWq2I+j0dX1
 /0MP1XK2QJwwT4lLQayYMrNWxhg8RLSDgaRA/tEUh511+JAnq/uyrg3fED+VFRNiofwi
 hHWH1lM2fqmZ6xbFqW8oqhxjulBG+IMaaqT99yJG2pfclGgC5fGppWTV7blqDRbiMHlG
 t/zQ==
X-Gm-Message-State: AOJu0Ywk9kda76Yji1bLVPH23gpxT9ciLBSSqSEHKBlp4gE3CAfNCT2N
 AO15DRc5Eb3jclvNlVnlF/iDlaakzT2WxGRFNDMsApjf+MM/O5lz4OiPIcLu52hNcnVfJwaqJmV
 0waHKg+X0l8IgWnz9h58kbCfoSX8mi/76kOhVrzCZlZ9GPXlsBi1T/hQ1Vm/9Ymg=
X-Gm-Gg: ASbGnct2HnaUfJZ9zTx8WpldYOi8qORRaCO1eGR4vllIUhAMWMceiShF91rtPfvG+2w
 1StJnVX7TIGPInbljuzsBNi2+oYSeMlHssMc1zGAdkcEXtBhfzsTIAbBubBMXGFPuYnJL2cup8m
 wVRRU1r0r/D9v85ki7s/M3jSB7NlHmAqBTBZyIS3hzQzmpWB7EHmQxJKOyId1wo1PWJxlH7Yw/z
 7vE+Db0WGxg+r7okfSYyirEncjpEc4riuSqcWqaoWwzB2mid4s5EHVOVKak6BIY5E3czko14Osj
 NsNpRY6shwLQ/eC6pqD4cQEZGOQCXeUd3lE/XV7GGfb+SYJEw6oI6E/EPY3E0OFdqm1Go2Shwpn
 95vXUHBeZCnfGzHF2ngy+BHXwXRejsXfbceucOMHbb4QwpoEJ6NE=
X-Received: by 2002:a17:907:3d06:b0:b29:57b0:617f with SMTP id
 a640c23a62f3a-b46c3551d7bmr389668966b.1.1759305673433; 
 Wed, 01 Oct 2025 01:01:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNl5uDBcjTWdlbePuItCNpVFR1/yBRbgjA39Qn/2S4GFpr+EHUTfceNTBXQ89N5BppFxWgzw==
X-Received: by 2002:a17:907:3d06:b0:b29:57b0:617f with SMTP id
 a640c23a62f3a-b46c3551d7bmr389662666b.1.1759305672833; 
 Wed, 01 Oct 2025 01:01:12 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353efa4c35sm1308559266b.26.2025.10.01.01.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 01:01:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH 08/14] rust/qobject: add Display/Debug
Date: Wed,  1 Oct 2025 10:00:45 +0200
Message-ID: <20251001080051.1043944-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001075005.1041833-1-pbonzini@redhat.com>
References: <20251001075005.1041833-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Swf5xqrf9KBmDsoEL2Lvx_oJcMxKGr97HjBfRTigDSQ_1759305674
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index 1c18a491720..b6e86f11a64 100644
--- a/rust/util/src/qobject/mod.rs
+++ b/rust/util/src/qobject/mod.rs
@@ -12,6 +12,7 @@
 mod serialize;
 mod serializer;
 
+use core::fmt::{self, Debug, Display};
 use std::{
     cell::UnsafeCell,
     ffi::{c_char, CString},
@@ -231,6 +232,33 @@ fn drop(&mut self) {
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
2.51.0


