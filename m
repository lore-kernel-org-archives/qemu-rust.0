Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uN7eI-0007jS-Ka
	for mharc-qemu-rust@gnu.org; Thu, 05 Jun 2025 06:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7dh-0007Lb-Uv
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7dg-0001FX-7N
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749118559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=psGQCsDtbA9u1IgUQ17MAZj3PqlJT0bXnc6QWWOT9MY=;
 b=eMgj5pSKyXKZdAj8suNctN6kdSgRSdiALjxCfJnm3lPnrVmEXC5kTTiWZRGcJt6VCfP+Yc
 v1CFP+Yvy8G5mf1ELfkvkvsIq/QehabjL0etGh8G53a4G3EwRsqZ64taNyGyHQDM98S6nK
 bnutcYDrULqgcJfJydmQAawBYIPmPJM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-4XHfFcPgNXmmglc6d82WsA-1; Thu, 05 Jun 2025 06:15:58 -0400
X-MC-Unique: 4XHfFcPgNXmmglc6d82WsA-1
X-Mimecast-MFC-AGG-ID: 4XHfFcPgNXmmglc6d82WsA_1749118557
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a52bfda108so241386f8f.3
 for <qemu-rust@nongnu.org>; Thu, 05 Jun 2025 03:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749118557; x=1749723357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=psGQCsDtbA9u1IgUQ17MAZj3PqlJT0bXnc6QWWOT9MY=;
 b=XBOJWqzuFjToP4MjIiJA67QZt5gi2pPC+gRts395uoZENzSXN8O6pw+kZMDivCBVCv
 zFOVf/hFbUzNNfzyXeacQ4qjWlprxO+n5Y2st0kRf6oWckp2BLfXBECUEvjsznJgsSti
 v+0id9HyvC1xXifj7OGI+R3B2NSjPWUBBjBEV6QxEQKhmFdGQpQRinjesRkIEVxsKQTj
 JCw/LHvkV2Vsopov+WIWiwg5IS1F1HQjt8qAulmoBFFBV97RtBSEHa+yqU/N/CRYKeA7
 tdNybCK90ITPcPaoJ7rAftzPhD3yv24Nehtvdvpe/uZ5PYihJGE8kSq1eOVnKC9oo3oJ
 Svhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB2wo7FBrQJbycDrTDjgofrwGQnizQriosdrHLo9hzwdxRLwyPuvqDBiTQ+5J3EiIK45PLw2w1iiE=@nongnu.org
X-Gm-Message-State: AOJu0YyGPumlxkwk+Yup0bsUI4k0z1Rd91KgANhR4PwmxrHq4ipiz+ll
 JIU7n4V9zpJwBAcjQeuWhZMMjZhVWO4ZJQyuC0077VrVb4J2EZIcuNc8JGuSSlmtEbjuduv8xxP
 Inw4rqLSgZ89wzubomLxQQsHiDraGNe0Ex5TzFpGzcGlPDxPphMT8hsk=
X-Gm-Gg: ASbGncvK74QIovR1HfeVjiTlSqHhbzJq06cErSSbpeB3UkoHHKm9N4jc9Ny7kTwQSLy
 sVzDMUx8MbLukbpF9gDPjz+u/Z6g4NOoORQHMjLxvSQY8qk4IlvcyWDr31WtNCA83f/iuiTVeKZ
 PGsC/n6vZDRyeIe7dX/mw7Hs80dgaWXkasz8HK+0IE3WajkWLJV7B6bLr8OcOJsbaUT861m5mMe
 Oosc8zRnUfFjrg6FZyy8hm0V0Uu8DCi8mXhT0WBtLV1jXNxfrWG3z3MXabrrzBMIFOM7/nA2+af
 oDM91vfrdHaEfw==
X-Received: by 2002:a05:6000:2dca:b0:3a4:e672:deef with SMTP id
 ffacd0b85a97d-3a51dc316bamr5120359f8f.36.1749118557162; 
 Thu, 05 Jun 2025 03:15:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESn4TJ1Nv+9oCOJthj98uXX8fq/Wd26umb9n2DmamMGTbXBJfu9AvZuf5k2jcMUwm1A4guCA==
X-Received: by 2002:a05:6000:2dca:b0:3a4:e672:deef with SMTP id
 ffacd0b85a97d-3a51dc316bamr5120338f8f.36.1749118556822; 
 Thu, 05 Jun 2025 03:15:56 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451f991967csm19454965e9.32.2025.06.05.03.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:15:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 04/14] util/error: allow non-NUL-terminated err->src
Date: Thu,  5 Jun 2025 12:15:33 +0200
Message-ID: <20250605101544.368953-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605101544.368953-1-pbonzini@redhat.com>
References: <20250605101544.368953-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QUdXfNaABw0Rz7fJgs4q727-vNFnQ7jIUBAnwb6wsaA_1749118557
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
X-List-Received-Date: Thu, 05 Jun 2025 10:16:03 -0000

Rust makes the current file available as a statically-allocated string,
but without a NUL terminator.  Allow this by storing an optional maximum
length in the Error.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qapi/error-internal.h | 9 ++++++++-
 util/error.c                  | 5 +++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/qapi/error-internal.h b/include/qapi/error-internal.h
index d5c3904adec..1ec3ceb40f0 100644
--- a/include/qapi/error-internal.h
+++ b/include/qapi/error-internal.h
@@ -18,7 +18,14 @@ struct Error
 {
     char *msg;
     ErrorClass err_class;
-    const char *src, *func;
+    const char *func;
+
+    /*
+     * src might be NUL-terminated or not.  If it is, src_len is negative.
+     * If it is not, src_len is the length.
+     */
+    const char *src;
+    int src_len;
     int line;
     GString *hint;
 };
diff --git a/util/error.c b/util/error.c
index e5bcb7c0225..3449ecc0b92 100644
--- a/util/error.c
+++ b/util/error.c
@@ -24,8 +24,8 @@ Error *error_warn;
 static void error_handle(Error **errp, Error *err)
 {
     if (errp == &error_abort) {
-        fprintf(stderr, "Unexpected error in %s() at %s:%d:\n",
-                err->func, err->src, err->line);
+        fprintf(stderr, "Unexpected error in %s() at %.*s:%d:\n",
+                err->func, err->src_len, err->src, err->line);
         error_report("%s", error_get_pretty(err));
         if (err->hint) {
             error_printf("%s", err->hint->str);
@@ -67,6 +67,7 @@ static void error_setv(Error **errp,
         g_free(msg);
     }
     err->err_class = err_class;
+    err->src_len = -1;
     err->src = src;
     err->line = line;
     err->func = func;
-- 
2.49.0


