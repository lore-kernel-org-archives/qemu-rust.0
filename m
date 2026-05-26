Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35022CD6E43
	for <qemu-rust@archiver.kernel.org>; Tue, 26 May 2026 17:59:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wRw1U-00027c-5f; Tue, 26 May 2026 13:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1S-00026U-NS
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1R-0007zz-1v
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779818216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x3lLT2zM00XZeVcrpc+cb0TqWQYGfu4gptrjRd0nz6o=;
 b=axJqW6mlDKqQ+z4gNnPbel/1bzCAxncS72tjTYFUpRdViN9p6YQGyJ4NF/lzR5f8QHtzRn
 2ZPuXiCk6xJkDKxFfqEb90z7fs30cOnlNxtZxbae961ITRo+IEf3/c+qLpjVz6+N9PqjaH
 Vo3HEdB7Ik2dRBKx/GrKC3GDeUOTbhQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-GP6Gx464PPSMP-7_NB9ebw-1; Tue, 26 May 2026 13:56:54 -0400
X-MC-Unique: GP6Gx464PPSMP-7_NB9ebw-1
X-Mimecast-MFC-AGG-ID: GP6Gx464PPSMP-7_NB9ebw_1779818213
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-48e89faa62eso64044295e9.1
 for <qemu-rust@nongnu.org>; Tue, 26 May 2026 10:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779818213; x=1780423013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x3lLT2zM00XZeVcrpc+cb0TqWQYGfu4gptrjRd0nz6o=;
 b=EbJF6GCnmGDshLV/1/al4Jmwc9GhX06PgmJcWsjWykUXfxp6Xg0AxuOMp3uC8AJ03R
 VCCBSlQ+lUFYNEBVV8xFgZRXjvBypKgeLoZtRZVFKy51GZlUY5BRzkS4Dr97W9nR19fE
 i3bwrcS4NIz1ieYmcTkZmJ18ob52KkquY7qpC0/kt+im6mpN3PajE+UgVRXFGjiLPdzL
 tpfT4XlBoVUVIosNxuWM0B/a2q7Ayspq8MO0I0OfrBq3D3FgraoTBQ0Vg7153LVIPYOq
 vTFyp2cc6q7jT9Cg6PIhqdgivMDt6o4qq0DWqnDqm1d3cl1syajtIwoaWvWgOy5DUe0b
 5AOQ==
X-Gm-Message-State: AOJu0YyU7fKFiebjufOvIf2e2UCRhek1QXhKGvDEiDPWu8ZcWA7YHLEs
 zjo4PEbt5zeLtCgTLDxw5V1eCoxJWG4RBr/Lh2+Af/wM6/qWpP2seLjr9PvRD4FaBlhKx456Vga
 Wp5l2AbzcC0yu0ajOBibV1LREiJ/W0YZgN4FZ4hd7kwoYS06PsYyAt94=
X-Gm-Gg: Acq92OEKjAWcGT8UetOGqEFL1GSK43dcY6r9R569ggTe+tcWBh2tOsPz7SpXbYdmQ5H
 z8gIuvvHZ1vi4J4/kQM3xx9Yq0VOndIi0vCx0sb3i7wF7mrEj8bs6HuEvSTYlWLJSn7LocLcwag
 Q+i9zVvjJKmJfy2tmmvp+MOXdjYJJZePWmhCBGCl/FifKjhJG5gk1uX+xNhxe3pVCMkyrcOTmUE
 P8HFpuQWvXeIpyxx7V6S9ImVE7JWo55Zm33dzmUMlihO52JKOXqBeShs9QoqDmaFiYzCIZW5/Wi
 br0JFpVYN/KhldGuD3fg6ZbM+ZdPaQvoulPKMSVeDpLNBQObthvovIPgVFPukeHl6hzX3Q0K5hI
 P+EnC4I8D8Ckt5TukhcTd0lKIQk2gG3ScXsDmgEvswJirHmSWwmIFUyZtwFH42U6wq7HjV/izCi
 2Hmk9M3VOPynHLNW/lIfOwD6RbJDE=
X-Received: by 2002:a05:600c:8484:b0:490:3b87:be0e with SMTP id
 5b1f17b1804b1-490428e3362mr339037725e9.29.1779818213244; 
 Tue, 26 May 2026 10:56:53 -0700 (PDT)
X-Received: by 2002:a05:600c:8484:b0:490:3b87:be0e with SMTP id
 5b1f17b1804b1-490428e3362mr339037425e9.29.1779818212907; 
 Tue, 26 May 2026 10:56:52 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.251.208])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454a0b9asm336811565e9.11.2026.05.26.10.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 10:56:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH v3 12/19] scripts/qapi: add QAPISchemaType.is_predefined
Date: Tue, 26 May 2026 19:56:11 +0200
Message-ID: <20260526175618.227743-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526175618.227743-1-pbonzini@redhat.com>
References: <20260526175618.227743-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EaTYHnFWdFlDLY1vS5agdggbLqd2QaHLkbxS0D4QOVA_1779818213
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

It is impossible to call is_implicit on an enum type from the visitor, because
the QAPISchemaEnumType has already been exploded into its constituent fields.
The Rust backend is also not modular (yet?) so it is not possible to filter
out the builtin module; add a way to query for implicit type names without
having the object itself.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/schema.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 7bb9fb712cf..3459b8038e5 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -1255,6 +1255,17 @@ def _def_builtin_type(
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
2.54.0


