Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uN7eL-000866-GJ
	for mharc-qemu-rust@gnu.org; Thu, 05 Jun 2025 06:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7dm-0007NM-62
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7di-0001Gk-TX
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749118562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ww1lY6S2uTksI0wQpy/g8QzaKoXGCoLz7u1pFjqzdyU=;
 b=FpRWMDwqGN7rZgxt2sBL5kjZ/e7zIo+J0mkGkq+ng9YanLH9dl+M9X0NJnWnB7tVh+lWx1
 WJBzp1UYEitTOqwRzSZn73zcUlmabgccmyMjGJ64oAo/xM/PSPDnZ8TBWiPrt5jLDl5D1w
 3IDdV28IbjeWt/LJNwheui59kZpgBk8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-jSabwcn1MsS366GsM85iUQ-1; Thu, 05 Jun 2025 06:16:00 -0400
X-MC-Unique: jSabwcn1MsS366GsM85iUQ-1
X-Mimecast-MFC-AGG-ID: jSabwcn1MsS366GsM85iUQ_1749118560
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-450d50eacafso4388845e9.3
 for <qemu-rust@nongnu.org>; Thu, 05 Jun 2025 03:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749118560; x=1749723360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ww1lY6S2uTksI0wQpy/g8QzaKoXGCoLz7u1pFjqzdyU=;
 b=DlFon85D4oOCUr3WzwMe82a1A1jRC1aBwKTliP6TWvnEujvcr1n/K5zCzCDErsFJbo
 GvPb6clVYRkcBUJTR8AvGMIEZAnOPepQguRDW6sUCSYoWGZNZigbdSrv9E/3bRtDtmfu
 mjo4aLbR4DVcT7lbaWUHGiCMiYKbJehg326heNbA7oyttEz1x8J5fnwqsjpGd8NMJHGr
 oixPPFsitdpdBcFaUwg/HwYUou8+c0r8y4YE46iVwGVpyRImyHcaTsEjKRcuaScb2Xwy
 fIaHsWHQQMi7JF1d/yvlw5GlGTtf3kKjgW7Qa39pA+hUp9I9Yh8o/+7Is1gZuiuaUgq6
 Fc/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZDbZpvqmByN0Ymuy/oUZEuWqh5CArNRdIO2X1j8XBaTHWXwKNerg8Xohy71wH+pcLyftr+6L8X2o=@nongnu.org
X-Gm-Message-State: AOJu0YzeGBbIgRYgEjIt0zo9MN5raGNNdDpCocqIAlbGVEkCv0DgYWAj
 Bq07uk5VVVmv1FQw8WP+ULxAAJ0Oe92WxNxA9dyQGfivrjGBK/GFyEvi8tzI2J92ePraBJU5qUz
 lsMmlbhbOeyoYPDKMLYs2xD7CYVKdrb+JY4zeEnxQJIoXqIxxBYx4ecs=
X-Gm-Gg: ASbGncshXmKrrE+Lq0ZSk369KVTOgGS8WoSht/XzbsMNgjgrn1uWNNvroQsQAk31ZTH
 ZA1xwt6G7cnNC3FR3LCPm/EqTw8UiKv0wXETPhHNqhvQemhAkFBYVW3voaLP2pjJs7d6yF0XeAZ
 SMljobtbjoc4TciBqkjy+rEQQd/8h6cgN6yfSLHIp6HdOevFMvpswsze9qU9Xf4eTNWaHhrang3
 tPB6eQJxElE7TWGYsuEYG3PxTpHM8vsr6pbZF4DzGGsq45POKywWMQGyWfw5b3sEN82Xz26T7mF
 hYtJIxB2mKsf6A==
X-Received: by 2002:a05:600c:35cf:b0:43d:40b0:5b with SMTP id
 5b1f17b1804b1-451f0b2b971mr50215265e9.25.1749118559591; 
 Thu, 05 Jun 2025 03:15:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA7uY2sJxfenVRpiIC/YNB1/Nm4cqdZYFWdoBOao82vWmscWVycTOEpBupm77P3VZTkOqY1A==
X-Received: by 2002:a05:600c:35cf:b0:43d:40b0:5b with SMTP id
 5b1f17b1804b1-451f0b2b971mr50214985e9.25.1749118559178; 
 Thu, 05 Jun 2025 03:15:59 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451fb22a31csm13562505e9.36.2025.06.05.03.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:15:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 05/14] util/error: make func optional
Date: Thu,  5 Jun 2025 12:15:34 +0200
Message-ID: <20250605101544.368953-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605101544.368953-1-pbonzini@redhat.com>
References: <20250605101544.368953-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Fp5Zan8VWYhxjfMnkfHlKqm0SD8gXvBrCRtCt32hWJc_1749118560
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
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
X-List-Received-Date: Thu, 05 Jun 2025 10:16:11 -0000

The function name is not available in Rust, so make it optional.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qapi/error-internal.h | 2 ++
 util/error.c                  | 9 +++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/qapi/error-internal.h b/include/qapi/error-internal.h
index 1ec3ceb40f0..ff18a2086d2 100644
--- a/include/qapi/error-internal.h
+++ b/include/qapi/error-internal.h
@@ -18,6 +18,8 @@ struct Error
 {
     char *msg;
     ErrorClass err_class;
+
+    /* Used for error_abort only, may be NULL. */
     const char *func;
 
     /*
diff --git a/util/error.c b/util/error.c
index 3449ecc0b92..daea2142f30 100644
--- a/util/error.c
+++ b/util/error.c
@@ -24,8 +24,13 @@ Error *error_warn;
 static void error_handle(Error **errp, Error *err)
 {
     if (errp == &error_abort) {
-        fprintf(stderr, "Unexpected error in %s() at %.*s:%d:\n",
-                err->func, err->src_len, err->src, err->line);
+        if (err->func) {
+            fprintf(stderr, "Unexpected error in %s() at %.*s:%d:\n",
+                    err->func, err->src_len, err->src, err->line);
+        } else {
+            fprintf(stderr, "Unexpected error at %.*s:%d:\n",
+		    err->src_len, err->src, err->line);
+        }
         error_report("%s", error_get_pretty(err));
         if (err->hint) {
             error_printf("%s", err->hint->str);
-- 
2.49.0


