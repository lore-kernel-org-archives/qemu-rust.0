Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6021CD185EF
	for <qemu-rust@archiver.kernel.org>; Thu,  8 Jan 2026 13:11:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vdpnJ-0007eK-SX; Thu, 08 Jan 2026 08:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpnI-0007dL-Ge
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpnG-00081d-P7
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767877874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0E5oaa3MQAn5B2LP1tawJrB7fiKlLEpjdtNPCmWmE88=;
 b=INrbDS7S2XeSkDQAKWZnjeyzU2IPmY7K5seSLYebWQe8/aaxi1EMXNfvzywS5AAX+8Dpwm
 kuxpN5qEUD5kUSpwdoD48xKhnGkDkjt0UpogZyXm+3163yKV2jdFkt2PTTRv9bwBwRy7UD
 ibeceA9FpANUhQ7bPsUJM4Kv9P4b5zY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-hB10VBY4OHqdKWestmgOuQ-1; Thu, 08 Jan 2026 08:11:12 -0500
X-MC-Unique: hB10VBY4OHqdKWestmgOuQ-1
X-Mimecast-MFC-AGG-ID: hB10VBY4OHqdKWestmgOuQ_1767877871
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47d62cc05daso19598575e9.3
 for <qemu-rust@nongnu.org>; Thu, 08 Jan 2026 05:11:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767877871; x=1768482671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0E5oaa3MQAn5B2LP1tawJrB7fiKlLEpjdtNPCmWmE88=;
 b=aD6aSpIVkOBJOLJ+sO1r/MHp5gfTLbSbDWBu+A8jDFH+LBV5hIwHAnkvcp6TNrI1e4
 ZwJGyRtimg62uCnwxK8NCysvWaa6lO55VpX1byl76AkeP5bGAJR30Qd76btaKIjmVPtX
 Ekvv+f9ZJb3MpYzJkmwqwVARQO0Gd6/n2is41eoNDgRFPwy9DjlMiKHk6P7nIcV1t/UQ
 oTJgKNVLKvddQvOSk/5tQCSynAA9JyF+EVmb/L2HU9IIzQ6h0GlQ3GYApn74CmLtotqM
 bgsfz8LHTESjrnUsN7ONoj4BXPBaLOOh0OTkcinGJgetr/SIdnNuthlje9a8CuRl7V4L
 jxYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCNSl5tgz7FZN32Vc4czMW9gX/ueDZ4TimkGbF+zR0BlrO1/2KdXhBfxID9XHH8Wy5Eii8cohySEU=@nongnu.org
X-Gm-Message-State: AOJu0YwIbZIk2rljNzVUYZP5jdfnpNNtDzB5RWd34OL+57r20JRCrJ7r
 qsuS1oTuBfzB67MzC1cdtO49Yawuoca0y1ohmy4NGw9kF/Pm8feWxHJ22ZsdzxFE0ETmSlvUOsT
 Ag3fRr/lBk6QO7W+LOfbmvX0MgH/UTgWUJQ3Nz8X3RmuPgTf406zow+eUbd2pRnU=
X-Gm-Gg: AY/fxX7hxvBf+YJZXefAIUB20jByxzVUT9wI993R/u7OJC3GCJfajdrsjC7gCY7DJrw
 JJ2AxPA0lWLz4776zpZFFDMnYYU1A5RLyE0c8U/VsESEXVglPNoN5Pqe+c1OrNtrPT5Vyfqbxkc
 ZJD6U3EtwmFxRW/78iEPf9DuwCuMA/NuJPZnc9xKER1krggNnn0MccvRuKCM3oPQgFIla/TrRFA
 ri86dfquZuoktsnwaRHXcHQmqkjwM4qRkFQ6OtAnZgq00/DUgjH78EkAJQJzzQ7mLIgJ6tjpn81
 4WyfK6nD//6KzHWDmSZF9UUs9qbAgcFMl+m6UB1sikPvu0oc7igwUdjxZjOxM08awEGr1wuO4hL
 FPxISmnVkt2QrO5XRysBp5XfQBO4ydZdlrtK1UrSsmuVqIeKg41DZNxbBBuooTwObkWfSZ7caAp
 I93uXpzexekCfvdg==
X-Received: by 2002:a05:600c:3110:b0:47d:3ffa:980e with SMTP id
 5b1f17b1804b1-47d84b4101dmr63206505e9.28.1767877871123; 
 Thu, 08 Jan 2026 05:11:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEORBF3pH9Z8JBQv2ifgXj4MTlDYGlTPRH00T6XtzFVSNi6ECYe8urA1hTRN7/M++9RelRR7g==
X-Received: by 2002:a05:600c:3110:b0:47d:3ffa:980e with SMTP id
 5b1f17b1804b1-47d84b4101dmr63206255e9.28.1767877870746; 
 Thu, 08 Jan 2026 05:11:10 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d87189e54sm36061825e9.12.2026.01.08.05.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:11:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-rust@nongnu.org
Subject: [PATCH v2 09/16] scripts/qapi: add QAPISchemaIfCond.rsgen()
Date: Thu,  8 Jan 2026 14:10:36 +0100
Message-ID: <20260108131043.490084-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108131043.490084-1-pbonzini@redhat.com>
References: <20260108131043.490084-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cN2qtLsvUf5mCjxK92avGGIvjaf8ECdnwyy-ZqYJsVc_1767877871
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

Generate Rust #[cfg(...)] guards from QAPI 'if' conditions; it
turns out that they are very similar, with both of them using
not/any/all, so just walk the tree.

The next commit will put it to use.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Link: https://lore.kernel.org/r/20210907121943.3498701-15-marcandre.lureau@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/common.py | 19 +++++++++++++++++++
 scripts/qapi/schema.py |  4 ++++
 2 files changed, 23 insertions(+)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index d7c8aa3365c..14d5dd259c4 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -199,6 +199,25 @@ def guardend(name: str) -> str:
                  name=c_fname(name).upper())
 
 
+def rsgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:
+
+    def cfg(ifcond: Union[str, Dict[str, Any]]) -> str:
+        if isinstance(ifcond, str):
+            return ifcond
+        assert isinstance(ifcond, dict) and len(ifcond) == 1
+        if 'not' in ifcond:
+            oper = 'not'
+            arg = cfg(ifcond['not'])
+        else:
+            oper, operands = next(iter(ifcond.items()))
+            arg = ', '.join([cfg(c) for c in operands])
+        return f'{oper}({arg})'
+
+    if not ifcond:
+        return ''
+    return '#[cfg(%s)]' % cfg(ifcond)
+
+
 def gen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]],
                cond_fmt: str, not_fmt: str,
                all_operator: str, any_operator: str) -> str:
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 8d88b40de2e..848a7401251 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -37,6 +37,7 @@
     docgen_ifcond,
     gen_endif,
     gen_if,
+    rsgen_ifcond,
 )
 from .error import QAPIError, QAPISemError, QAPISourceError
 from .expr import check_exprs
@@ -63,6 +64,9 @@ def gen_endif(self) -> str:
     def docgen(self) -> str:
         return docgen_ifcond(self.ifcond)
 
+    def rsgen(self) -> str:
+        return rsgen_ifcond(self.ifcond)
+
     def is_present(self) -> bool:
         return bool(self.ifcond)
 
-- 
2.52.0


