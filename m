Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AD7CD5BC8
	for <qemu-rust@archiver.kernel.org>; Tue, 26 May 2026 17:57:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wRw1I-00022T-UH; Tue, 26 May 2026 13:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1H-00021Q-4s
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1F-0007xV-1u
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779818204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGNiVyk3smt3QCBdx3Hb8LIxSZAyBf2ULYTGIW9VfTc=;
 b=C3p1jxzkKID7oQ1ddQA+O6mU0xMTbZA0CqU5zH5t6ivQZ+x/Nd7sgGn3gzIRPIyWchjHTv
 yEQvKo9SsDApbeCV/nIFoQJkxkfVuVAEHvHXkw64J99JVr7N0HChwmmw6gGLuttiXG6FDO
 hzVKcIoNwXR5bb13PoEtsovn3Q/47Og=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-FlfWOxRGPJGtvEukN6-G-g-1; Tue, 26 May 2026 13:56:42 -0400
X-MC-Unique: FlfWOxRGPJGtvEukN6-G-g-1
X-Mimecast-MFC-AGG-ID: FlfWOxRGPJGtvEukN6-G-g_1779818201
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48fed2519daso50325385e9.0
 for <qemu-rust@nongnu.org>; Tue, 26 May 2026 10:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779818201; x=1780423001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GGNiVyk3smt3QCBdx3Hb8LIxSZAyBf2ULYTGIW9VfTc=;
 b=DoWioL7uaNfgG3+bXdRW7eV/Od3Sls6NEGIx/pAEYzk6l4ScwndefaVII5ESQQv9xR
 an3UBZk6OeDTsfnJj1Wz9rUlM/jZDusZ4xY3w48HrdNUT/M7ABnFJo8bVWKSnkJnkxc3
 0UwRW7LjC8YAUz3ypQvH3mKjqU20mQqzMt8wc/foOCDUtYyeOiH4Z/crJyFIGYvicr80
 FX78HraAGyZgOEsVQZ8aHPhGYOe9oC39xdjzrDB20T8u94woUmHRGPaLZTFjXC+BcjS7
 5oDSVydQLxEsOOsgt7m1Bv1NNRPfIk8vR0KGwn2eJwVZWuoPIRZMmv4YkYAwD8iBR06s
 RUuQ==
X-Gm-Message-State: AOJu0YxuTVom8vH+rHjqV+PPJjOH7Wa4cIZxPf/+F28jBKJieTU2dODh
 N7jDCubIW/zqTyYzsKYxCYFMDqeoXPLgQ3pymE5V22RrFXQP0ufaUJ974kwDJTZJ/Zhwp6gCPQJ
 /I3hWMlDYFkBW5OtgDt+i/4xX/+PxfDu9ZDQcKbYZ4ExwzBSc8AKzS8o=
X-Gm-Gg: Acq92OFS5kuj/ODPxU4JgVuhFhW+F/PlSRDkt/NKhM/iTe19UMjkndBaoag2kj1UX60
 AVgqSG1ryn5BR5IvJpG96MdR59Z+BuVVmolmsLQyG419lNNNf574JUDrWXw11ShGItblgtHzBWG
 mzVrHfZDX7DYCFC/VsATnL3KVtqipLJB1lZhiPLSQLy17/eNTmufDk7+VWEkxD19GotX4ZjrsZE
 t5sTtdTCK09dFRpGDAf/W7jNGUdfyJxIzeU6XikhhMeEHEeF7RbjkBQwQ2GMjAvjSkOp5vm+z87
 iw6vXXXy61xIoq0hulg/co+2q+j7gacmq0M4v/M2xflhvzhWAV3xtU75P747UeAHtBuAz9zNr+f
 ai5zd7ZFThfucN3rMm2q3LHH/dKiFDpa7m3AGnJPp6CSADRvBk59p0x2zPvSRSdZLpUEqPrWAFQ
 RUcPFq+R+LmlOK/ONZsjMD4PhadOQ=
X-Received: by 2002:a05:600c:a402:b0:486:fd5c:2b35 with SMTP id
 5b1f17b1804b1-490426adf66mr270778635e9.13.1779818201351; 
 Tue, 26 May 2026 10:56:41 -0700 (PDT)
X-Received: by 2002:a05:600c:a402:b0:486:fd5c:2b35 with SMTP id
 5b1f17b1804b1-490426adf66mr270778305e9.13.1779818201028; 
 Tue, 26 May 2026 10:56:41 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.251.208])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454a0b9asm336792355e9.11.2026.05.26.10.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 10:56:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH v3 08/19] rust/qobject: add Display/Debug
Date: Tue, 26 May 2026 19:56:07 +0200
Message-ID: <20260526175618.227743-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526175618.227743-1-pbonzini@redhat.com>
References: <20260526175618.227743-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YMPMVRv53wPzb1XBOtvokuS5eN-uGWXv7ntUtFYHAF0_1779818201
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/util/src/qobject/mod.rs | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/rust/util/src/qobject/mod.rs b/rust/util/src/qobject/mod.rs
index d2dde9ba0f1..3e22dc8bb3f 100644
--- a/rust/util/src/qobject/mod.rs
+++ b/rust/util/src/qobject/mod.rs
@@ -12,6 +12,7 @@
 mod serialize;
 mod serializer;
 
+use core::fmt::{self, Debug, Display};
 use std::{
     cell::UnsafeCell,
     ffi::{c_char, CString},
@@ -272,6 +273,33 @@ fn drop(&mut self) {
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
2.54.0


