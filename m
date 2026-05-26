Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66E4CD5BD1
	for <qemu-rust@archiver.kernel.org>; Tue, 26 May 2026 17:57:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wRw1G-00021O-LM; Tue, 26 May 2026 13:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1E-00020M-JB
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1C-0007wh-Ls
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779818202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IwejE0qUh6l3AKjAZStBy9OZpi/ahgfNspmEiwXOJAI=;
 b=H+OIfPk1/QLvubHOiNSEdPf/8eEQkKYZgIYKkWZwyzbSJKNa+VSB+i2Ah6iw6CqtFM3odP
 9G92KgRsy7+jzg0UZC4i0ppMpjyKDFD5vxSQBq1mDKvWmgDdF0qRbE+Y4L2mzG+koNX134
 cVVaBruAU/suie0KzebuuoGR5RX61aI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-cvDVEd2OPIiUBoyowoAfZg-1; Tue, 26 May 2026 13:56:40 -0400
X-MC-Unique: cvDVEd2OPIiUBoyowoAfZg-1
X-Mimecast-MFC-AGG-ID: cvDVEd2OPIiUBoyowoAfZg_1779818199
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-45e7c7289c3so8458110f8f.1
 for <qemu-rust@nongnu.org>; Tue, 26 May 2026 10:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779818199; x=1780422999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IwejE0qUh6l3AKjAZStBy9OZpi/ahgfNspmEiwXOJAI=;
 b=P8W7P201VB+/Ej89pf5bcF+qv9ZNiFuwwZNsPqDWmuvuPBMoeU0bBjIFP7jH6mlcWp
 XGK7dhPOwgp19Rb51lRwn9OXXyFvwhCLRiU9ds1DgoQlFSaxNskV6Mv/7WIAZV7xzA4A
 9VGll0H4mJ0IHTLqAeYVm0YG+DgjPb0k1c8VCEd5LeJu5+OV52ucQxvX+deFjLAIoRiC
 G+mb7TkSzObTOr9Ph2oKKYkfCaq0mQNpfR3j0EooVMis4U6JKRni8Q0GWVznIE5eUmPN
 aq2/bovz/n3wJ5K+OCLY4XDX+SWs/je/+y4bzs43y13t+fSQIdFz3+UeZY4TAr3RMWGf
 9pjw==
X-Gm-Message-State: AOJu0Yxiz1qXvIwiiSDqkOFn6GDzEq9CEWalsapt0rlfaQJsjyhT1uZQ
 idkP4pPoSuHredAsB+5aCLZTn1FXdpI7I5Yg1A8yKWa+DpsUKQ58hTFZVLh6hGzFAjb+0uygdr4
 cdh5rBvsjSw5q3+pYaV0OKC6jiVua7yH6C6H+4sZRJgbcMLAJWj8mOOEotCx50AQ=
X-Gm-Gg: Acq92OGTBtVSx1iUJtm7diWjg0eC4XwxIbihsh7q5KgHeZiRpp3jZ+t7LuXgEMK9xMY
 gbHjWmjX2GQwiDMMNh9MTRi9Sy798X/s+W8O8/VyQT/N6h0RXmLsrGz1oE2yoVcB4SdNaNwqcbh
 WIDvuGH6A5T3MqWoF4+e8oK9FzpWqkOuSVK0YegpbTApFlVtYnMf2+cJF++wJcDOGGwChnUKBp6
 QDbhVt+Oz9yP5Vfcc15gzChnPWlhDDG15/4GQDdd0ZmXPdF3+Z+jHujeB3TlT5g3CperJLHOjjY
 IDeUjnSOapAoSf7PcRV0ynnIQTQlyQnWBtAlCa4+x5/UMfOq/MNPy8JJnaQTLBbM6fYbOFmGPL0
 65/lWHq5UOyAYpDA4raRRKfU85jxMAMKydYxd6hE9uoFJW2AcPutXo9Bhzzmss+B5XLiY6t3H+1
 T8kTRtun1vPuTspxcVmG9PJeuYBOA=
X-Received: by 2002:a05:6000:26c4:b0:45e:739b:2750 with SMTP id
 ffacd0b85a97d-45eb30ec2e2mr30809557f8f.9.1779818199266; 
 Tue, 26 May 2026 10:56:39 -0700 (PDT)
X-Received: by 2002:a05:6000:26c4:b0:45e:739b:2750 with SMTP id
 ffacd0b85a97d-45eb30ec2e2mr30809523f8f.9.1779818198846; 
 Tue, 26 May 2026 10:56:38 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.251.208])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6c9de2dsm35996346f8f.4.2026.05.26.10.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 10:56:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH v3 07/19] rust/qobject: add from/to JSON bindings for QObject
Date: Tue, 26 May 2026 19:56:06 +0200
Message-ID: <20260526175618.227743-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526175618.227743-1-pbonzini@redhat.com>
References: <20260526175618.227743-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yo00YGw9sEwAgWZZOKLb6ldp7340o1zlXjm4lnAD56c_1779818199
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

These are used by tests.  However it could even be an idea to use
serde_json + transcoding and get rid of the C version...

Co-authored-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/util/src/qobject/mod.rs | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/rust/util/src/qobject/mod.rs b/rust/util/src/qobject/mod.rs
index 76b167104d1..d2dde9ba0f1 100644
--- a/rust/util/src/qobject/mod.rs
+++ b/rust/util/src/qobject/mod.rs
@@ -23,6 +23,7 @@
 use common::assert_field_type;
 pub use deserializer::from_qobject;
 pub use error::{Error, Result};
+use foreign::prelude::*;
 pub use serializer::to_qobject;
 
 use crate::bindings;
@@ -114,6 +115,22 @@ fn refcnt(&self) -> &AtomicUsize {
         let qobj = self.0.get();
         unsafe { AtomicUsize::from_ptr(addr_of_mut!((*qobj).base.refcnt)) }
     }
+
+    pub fn to_json(&self) -> String {
+        let qobj = self.0.get();
+        unsafe {
+            let json = bindings::qobject_to_json(qobj);
+            glib_sys::g_string_free(json, glib_sys::GFALSE).into_native()
+        }
+    }
+
+    pub fn from_json(json: &str) -> std::result::Result<Self, crate::Error> {
+        let c_json = std::ffi::CString::new(json)?;
+        unsafe {
+            crate::Error::with_errp(|errp| bindings::qobject_from_json(c_json.as_ptr(), errp))
+                .map(|qobj| QObject::from_raw(qobj))
+        }
+    }
 }
 
 /// Rust equivalent of the C `QOBJECT` macro; for internal use only, because
-- 
2.54.0


