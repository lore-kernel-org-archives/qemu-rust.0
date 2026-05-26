Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47468CD5BD5
	for <qemu-rust@archiver.kernel.org>; Tue, 26 May 2026 17:59:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wRw1Y-00028q-Ci; Tue, 26 May 2026 13:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1X-00028U-PT
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:57:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1W-00082w-6i
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779818221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rwl60sYUdvU2FK56rokuqANsEss1jT96qzp7KeUwX2U=;
 b=Jrs6uXXLsd/KVHJBHCIGfasdR/g3Z3LlJ/vBFfjdgav87GCS2FMA2c57zhE9UnpU+n9d7p
 vZY1AratkMc5xK8VjOTuoToi2dCj3Szai6xSYpeLViva74u1owXm1PPYW/tO5W8CBQ7sTg
 GT/kpTbPcSatzK+A/dUECasISNq0h/o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-FF9aphLkP6i7PrtM2Obohg-1; Tue, 26 May 2026 13:56:59 -0400
X-MC-Unique: FF9aphLkP6i7PrtM2Obohg-1
X-Mimecast-MFC-AGG-ID: FF9aphLkP6i7PrtM2Obohg_1779818219
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-49048bcbeb8so49712605e9.2
 for <qemu-rust@nongnu.org>; Tue, 26 May 2026 10:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779818218; x=1780423018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rwl60sYUdvU2FK56rokuqANsEss1jT96qzp7KeUwX2U=;
 b=TjMYlvg+dwBBZcBjInHX51UB2riHNarqm33o3FfQjeJfNudzQkukk2gg1ix3NwbKSh
 bsZRbWEVP+ITsKR+l8VkagZbMlzzmR4OxMpxULB1+e8YfE+1/yeFNTZE30oRy+8or4qd
 mhrft0Y0nXjGljj5M6GYGfbJiqNXOauUZr61yVvZPI2HT/yOMCR99HwzuyKYYHDUj7DB
 taD7MYWcOPdweLUvjdiMwpE6EwVXeGJIE/U2hKk3wcKn1aymRHGy8xSLWwraQleYmxYa
 Hk9RJgg3hCJDLqoMxd21MfeCad9bZew39b/ejc+iBs4PSjtnWPMpS9Cn9zFME9ZSI8mn
 n9TQ==
X-Gm-Message-State: AOJu0YzYIcYj6x7HOzoyag77Eg/X+n/N7Ps59urRCIZEFNKbXfXPeH9d
 I9ilhpsOPzFU+WVTBFKNEaQoxDDTGoz4hx9wbcmtXFfdZcICQ7oqSeGuf1fPccojUEJ4xdrW1YF
 xI+8fTpKQns8Il5jdtGVueBtl/wGDI5sl5CcTHQAb7b3r5p01wj6xTkw=
X-Gm-Gg: Acq92OHNwDyDK+m1bDBKIsBWDRq1nqCmJbmTaGX0U1MMEHCCgB0ksvjm9yuRs3yXJdF
 eIU+aKlAlN8ueSPd7wFSS8rj1j+BT4n9/TD/0yZpYN2cDjXxntCvO1bDZvQJwiEUFYO4KNr8GxI
 AGzE3KpdVHSnRRcLbG/SQx7r3+3H2ewnX8dl04UcegHp22EezLTnATDUpb4egpDdbaPAbprB9uk
 uUmS2wtzrCW1FzA8nKNKoWOpGk3blqSf6fdk1TgcMGAg5/Hs06OTNGuSAEOgraywKUTqczrj3Rz
 FTwygz22AAQJLZnKZ0Xl1zh9UIqYP3+39DI6yckwMPhkgnclRFKvi4+ULU02buzC93a12qckKDW
 pboGDedcRJNejGgbRHbUP5O+Al7y+mJbO7bqiwtIyKr5EuFjZM7wgzU1XerHaqbRy7kv3eQh6Fh
 PEihAy/fsOn78/8ZWzjmtf22mbc1E=
X-Received: by 2002:a05:600c:818e:b0:490:58f4:ba23 with SMTP id
 5b1f17b1804b1-4905c60ef29mr193631715e9.30.1779818218677; 
 Tue, 26 May 2026 10:56:58 -0700 (PDT)
X-Received: by 2002:a05:600c:818e:b0:490:58f4:ba23 with SMTP id
 5b1f17b1804b1-4905c60ef29mr193631435e9.30.1779818218325; 
 Tue, 26 May 2026 10:56:58 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.251.208])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490452765f5sm354517775e9.5.2026.05.26.10.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 10:56:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH v3 13/19] scripts/qapi: pull c_name and lstrip from
 camel_to_upper to caller
Date: Tue, 26 May 2026 19:56:12 +0200
Message-ID: <20260526175618.227743-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526175618.227743-1-pbonzini@redhat.com>
References: <20260526175618.227743-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SauVTT-2fiDO6k_e7Ly_ynsdmCJYTp9Y5OBDTZpKbng_1779818219
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Allow using camel_to_upper for other languages too.

In particular, the lstrip() is needed to avoid reserved C identifiers,
for example:

    typedef enum __org_qemu_x_Enum {
        __ORG_QEMU_X_ENUM___ORG_QEMU_X_VALUE,
        __ORG_QEMU_X_ENUM__MAX,
    } __org_qemu_x_Enum;

Insulate Rust from this, since underscores have a different meaning
in Rust (though only for the sake of warnings).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/common.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 14d5dd259c4..c75396a01b5 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -61,7 +61,7 @@ def camel_to_upper(value: str) -> str:
         ret += ch
         upc = ch.isupper()
 
-    return c_name(ret.upper()).lstrip('_')
+    return ret.upper()
 
 
 def c_enum_const(type_name: str,
@@ -75,7 +75,7 @@ def c_enum_const(type_name: str,
     :param prefix: Optional, prefix that overrides the type_name.
     """
     if prefix is None:
-        prefix = camel_to_upper(type_name)
+        prefix = c_name(camel_to_upper(type_name)).lstrip('_')
     return prefix + '_' + c_name(const_name, False).upper()
 
 
-- 
2.54.0


