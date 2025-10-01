Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E20CCCA470
	for <qemu-rust@archiver.kernel.org>; Wed,  1 Oct 2025 08:03:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3rmC-0005fL-Pd; Wed, 01 Oct 2025 04:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rm9-0005eg-9x
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rlp-0005zc-S8
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759305658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkDh2PxrD9+QTzw6kMUAgyF3bTdWXZdPJnZrIUKZWws=;
 b=bgJzsVJqVXk/40lFb1AwiRH857Atf9S+DYHZ6ESejGVeuO4CvmucX37xZxRBdnYN+KRPrC
 qLjAVx67fjwNDrEW0hMWIPJGU0UjCHX0lrBnXLO9x1z0CirLfzYeJyKsAZiVI8amXTcDUB
 O4Mt8+S9g/MlRAb2ryc7NIUwucewMhc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-28OReeD8PA-BgFoR08yZEA-1; Wed, 01 Oct 2025 04:00:57 -0400
X-MC-Unique: 28OReeD8PA-BgFoR08yZEA-1
X-Mimecast-MFC-AGG-ID: 28OReeD8PA-BgFoR08yZEA_1759305656
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-aff0df4c4abso720695366b.1
 for <qemu-rust@nongnu.org>; Wed, 01 Oct 2025 01:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759305656; x=1759910456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkDh2PxrD9+QTzw6kMUAgyF3bTdWXZdPJnZrIUKZWws=;
 b=g280GGWIvhnCAbf+Ly2C31Ka1G7Ki0FTFuHfgG/Bt6IpXSfevQ+NyBdzDRTcZ34J1H
 lSvdhN6jZXM3E3P3UdcGctdPX+zb15r65mjSUvz1Qp5lRsR665EikFYa1mrbM2JUUyLw
 kZenLvukUuRwg5/3ze/FXGJs4efd0coavAMqS8MKHmfCzG7u3L5ztWCiWWoNwf+cr4SY
 HrDfxkgTQkJoUv7ssnzMSKskY+5ILMuChtJOOwrdeST371okgsG5KQnaUx82xw1GhQww
 j7Z1rRK6wpHN0eWM59RyndMYL892b33nYb4i0y6qrnxftRylx3tQBhZa0EfRGi0oKNhh
 2rHA==
X-Gm-Message-State: AOJu0Yy0SxI2ZtIhc2CiWjzDBbtMX4GgVIjGO1ThTttn+Wjy4bL8RUv5
 G3F4ntePMkuUkMKmt/VXnT4V0lXKI8UF2BiKGhLAZiVba+O0RR4kyx9UG9Qxo135GUNM1FNUbU5
 SVHaNjRXWG5twpzxb+r0Bt62Vrct2pyb1kPv5ZuMIMmn89pgUG2vJZDM=
X-Gm-Gg: ASbGncuNKU3im0DXmyolzSUT/Cqq/uNqfgidvW0EJsD8MIu606goF1VAflfDsLw0ncw
 /D2FOf4b2kUkiMK1CJWLi6BR+3tKIYNAdY44moNx75Yr2VtxBu6TFdvuy9+/ABEqsssT3FPyzLt
 5v1RRlg/BOyAmhPlfI+rRJ9XBcLx8qrJO5a3vSoj32IQx7frCX+23sz6QyTSFkc7DQyvIAeajhY
 +/8KmON6C9uplIlB6K6djSTIN/8j6Q6vLPKUV0l65FrT5tuFts5hv/FM0edBXCfBYTLw2olzZqU
 6xIP6HlY4DALO/YnMKJ+ffk2itGuyJRTI9/2Sik76V2kPsIrG79bF8wize0MjHnetLezwEencOD
 fcYyf6qIEzRbloyRgeayT/EE3gA/VWiqTtLYG2SPNW9axmZB9I9Y=
X-Received: by 2002:a17:907:94d1:b0:b3c:193:820e with SMTP id
 a640c23a62f3a-b46e4d7d8c1mr292714766b.13.1759305655658; 
 Wed, 01 Oct 2025 01:00:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2pgmqTtXUVLor5PDotVsFol3CAg18Nx5vgeT/XIGhPoIS9gpRvPmj0A4DzQ9tzSSQ87gf3Q==
X-Received: by 2002:a17:907:94d1:b0:b3c:193:820e with SMTP id
 a640c23a62f3a-b46e4d7d8c1mr292712266b.13.1759305655277; 
 Wed, 01 Oct 2025 01:00:55 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b41f5ed2cf2sm359927266b.36.2025.10.01.01.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 01:00:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH 01/14] qobject: make refcount atomic
Date: Wed,  1 Oct 2025 10:00:38 +0200
Message-ID: <20251001080051.1043944-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001075005.1041833-1-pbonzini@redhat.com>
References: <20251001075005.1041833-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -o7HgOGNfqhfYsYCsr5A1tyrWeaaD6bQoD5hE_1TEBc_1759305656
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

The Rust bindings for QObject will only share a complete
object and treat it as immutable from that point on.  With
that constraint, it is trivial to make QObjects thread-safe
just by making reference count operations atomic.  Do the
same when the C code adds or removes references.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qobject/qobject.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/qobject/qobject.h b/include/qobject/qobject.h
index a6244d0ce00..02f4c6a6eb2 100644
--- a/include/qobject/qobject.h
+++ b/include/qobject/qobject.h
@@ -32,6 +32,7 @@
 #ifndef QOBJECT_H
 #define QOBJECT_H
 
+#include "qemu/atomic.h"
 #include "qapi/qapi-builtin-types.h"
 
 /* Not for use outside include/qobject/ */
@@ -73,7 +74,7 @@ QEMU_BUILD_BUG_MSG(QTYPE__MAX != 7,
 static inline void qobject_ref_impl(QObject *obj)
 {
     if (obj) {
-        obj->base.refcnt++;
+        qatomic_inc(&obj->base.refcnt);
     }
 }
 
@@ -95,7 +96,7 @@ void qobject_destroy(QObject *obj);
 static inline void qobject_unref_impl(QObject *obj)
 {
     assert(!obj || obj->base.refcnt);
-    if (obj && --obj->base.refcnt == 0) {
+    if (obj && qatomic_fetch_dec(&obj->base.refcnt) == 1) {
         qobject_destroy(obj);
     }
 }
-- 
2.51.0


