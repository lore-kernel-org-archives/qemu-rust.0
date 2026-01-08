Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3590D185F3
	for <qemu-rust@archiver.kernel.org>; Thu,  8 Jan 2026 13:12:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vdpnM-0007ey-D6; Thu, 08 Jan 2026 08:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpnL-0007eR-3T
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpnJ-00082D-Dg
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767877876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uACPJ3krJUuogeqFQ/FMG+kdPSn5YGZfGjsX3Hw0XBU=;
 b=gu5IinJRRQBeIlM3+oTONbH1qH6Rqi6IDnWYsEpIxRwiFl6HY2pqI3pxZAbVQj0WpoiMuP
 Im2b64S36aw6FJeF7VB1VPUx0iAjP7Y53pxtKxezjXvzmbdTxj96S8OA/J/P43d7SZCmcL
 LrmPVF/k33k7y2FVpe4+j0axQkx+3zo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-pe--kWNAOc-PLK62jZv0rA-1; Thu, 08 Jan 2026 08:11:15 -0500
X-MC-Unique: pe--kWNAOc-PLK62jZv0rA-1
X-Mimecast-MFC-AGG-ID: pe--kWNAOc-PLK62jZv0rA_1767877874
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477b8a667bcso35634535e9.2
 for <qemu-rust@nongnu.org>; Thu, 08 Jan 2026 05:11:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767877874; x=1768482674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uACPJ3krJUuogeqFQ/FMG+kdPSn5YGZfGjsX3Hw0XBU=;
 b=FPHHp9ulL/aX+N5sLugYmu1AbIb/nbtfuDyE6a2sasp78s15zXTeJilOAxjRUM26uD
 ufe5nMxGbHYiVoJ8FT9kxWW0Q4GydX8MgNcrfk8jaowfEOBRU1TZfhrCDFAuwsjQr/gi
 578kdh/jNvtQF81Xeb5gdBtCVaIHi5+CegKHIGTw/l1z3GE0Wbwv8CKvcd42cux6hUj+
 49HZCRUcxZpgbyAsTcIl/OqfCE8+coXAS5li/lAEdFGmxBrFqn//Bp+Rixe6cHfG6nab
 xMcYeIxKvjiX+iLQXyNGBHRHVL+2lHCaRdaCDzJaxFFMbYVevv17Hm0thaPs+ZzjZqRK
 32BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMN9zJe6JHHTjrJkVksY1reKHP+x85qsBC8uj2us7W77r0eyrnN9tGF7lW22i8Hz8fTO/iFk072f4=@nongnu.org
X-Gm-Message-State: AOJu0YxAgOSVnjXPiPphwRfNSuZUhjYML4zyQSlXnXg5pUnnsgcU4wZG
 SzIsT0sD8HEZCO9sXs9/KjVIhX42nvUkeqQ/thqNOGrJdaBZO4tBZE5HNKCa1c/i/IjiyRip/c2
 +AIxcX+OuEkK7wR8GKX22yjtrnu4jZX/it7HOi03p9VDpcw8c9f7EJik=
X-Gm-Gg: AY/fxX4KHgSD581EXcaNwPLBA4w370IrgDMv1XAK4dGFk8c4uRPHiYyz8hzQddwajce
 oYAQQfITvj9udr8r+6Cpzi1ak6h2T2Yp+2hXtj1ebyftU8+SEFXYZkgHmpKRLqKd3mUTAeNZGC4
 Qt1Yy9zARpSzAEQvboQDm+gH5i6/F9yLJJEOv36tXywXqSpvdUpRZaUgai2maRdYzxFHlJz3zfr
 1ROf46/U6/LV4cneIFPouOVGXfKMQcwSjMTGI3ZJBWvAc38GHM6gSBWJ9EApSZ0HyGag09Jg1QZ
 3SWzRGJffhY3Ux5BfkJNe5pJzI/FyoXJ7JCN1pQ4YCuY9UMvKIRLX89GAYfC9E8YXqBhbJG2/hf
 OqGCA5Lp3Bpqn7qCzalqJkcLkt0K14mCWGZETDX4r9oEkNb9pK2OiaiWWbqHKG4PU3WmTtDRrzz
 AOnAYBrH9Ndfg0Cw==
X-Received: by 2002:a05:600c:4709:b0:479:1348:c614 with SMTP id
 5b1f17b1804b1-47d84b41b2dmr72474545e9.26.1767877874343; 
 Thu, 08 Jan 2026 05:11:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzdn86O6GcGD3KNIx09WwJrMsgMzsGPd/wpZ83CXQPEcHNMRDuX6587bEr2jyIrHaOzHWwkw==
X-Received: by 2002:a05:600c:4709:b0:479:1348:c614 with SMTP id
 5b1f17b1804b1-47d84b41b2dmr72474355e9.26.1767877873993; 
 Thu, 08 Jan 2026 05:11:13 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8384646fsm118672205e9.15.2026.01.08.05.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:11:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-rust@nongnu.org
Subject: [PATCH v2 10/16] scripts/qapi: add QAPISchemaType.is_predefined
Date: Thu,  8 Jan 2026 14:10:37 +0100
Message-ID: <20260108131043.490084-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108131043.490084-1-pbonzini@redhat.com>
References: <20260108131043.490084-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jQJJBSjezJf4OwGuBaj-dEfWx4ZnhBedgxdAgAnym2g_1767877874
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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

It is impossible to call is_implicit on an enum type from the visitor, because
the QAPISchemaEnumType has already been exploded into its costituent fields.
The Rust backend is also not modular (yet?) so it is not possible to filter
out the builtin module; add a way to query for implicit type names without
having the object itself.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/schema.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 848a7401251..15f5d97418f 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -1243,6 +1243,17 @@ def _def_builtin_type(
         # schema.
         self._make_array_type(name, None)
 
+    def is_predefined(self, name: str) -> bool:
+        # See QAPISchema._def_predefineds()
+        entity = self._entity_dict[name]
+        if isinstance(entity, QAPISchemaBuiltinType):
+            return True
+        if entity is self.the_empty_object_type:
+            return True
+        if name == 'QType':
+            return True
+        return False
+
     def _def_predefineds(self) -> None:
         for t in [('str',    'string',  'char' + POINTER_SUFFIX),
                   ('number', 'number',  'double'),
-- 
2.52.0


