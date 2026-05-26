Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6846BCD5BC8
	for <qemu-rust@archiver.kernel.org>; Tue, 26 May 2026 18:00:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wRw1e-0002AX-LU; Tue, 26 May 2026 13:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1Z-00028s-51
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1X-00084Z-9O
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779818222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xeAc90a5JobVPESwPbooIYpcQ6eg5eVi/LK44TKf77M=;
 b=ahw4E8ab6/jHkcLk8FwIqj1SWhA8g+yEXKTwDNcU5uQbBl/lLGBhUKWZCNmtsdnc2iW/1y
 EKEY+/ynX1NaBAO4EktAWR6qSVtriJixnHVYwJCGj/m+R5Vs4XpDtClXJn3wM/3n2RAS3A
 kDxPGIPXZNFD57zd6DOfyBTNZx3PsjU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-qzYxmK6rN3OCAJcyAjzhzw-1; Tue, 26 May 2026 13:57:01 -0400
X-MC-Unique: qzYxmK6rN3OCAJcyAjzhzw-1
X-Mimecast-MFC-AGG-ID: qzYxmK6rN3OCAJcyAjzhzw_1779818220
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-45e81291d62so8966471f8f.1
 for <qemu-rust@nongnu.org>; Tue, 26 May 2026 10:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779818220; x=1780423020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xeAc90a5JobVPESwPbooIYpcQ6eg5eVi/LK44TKf77M=;
 b=acK6nZiEvCZhkeDToHiAWCEjpLTsLK8U+aYHIfeA/nSBtINgdn8M2CwY9lJAgmlMJe
 eIfN35YCRWd1ZylOQD/N+NX9ZtBX4NN9G04+r99JKimPjfO3OGWTTfYMpZ7lP1bgRkiP
 n27I7CRnSulMzNXYBu5XUbtp4ahPSwTJIpWlOEBq8Hsq+37pzvzrsquAgM5LRGEVRt+n
 DsY0VvDtyD6BfMN5Bh1J0rLLMw+EBPcF1Umy3c3CqZzkYN6PINO0nAaJBI6s2mb0CNUo
 GqFqaPOC3tP8BAd/l8J0ikBjpR5ZnJHoyV9gxp7ZiApmc1tWJa8yP1XwCoXZmERJtBmd
 kXKg==
X-Gm-Message-State: AOJu0YydlfRrgBo8FaCbtLYE4p6QLTfSaQ4f1/k0P2sAt8Wo3JLmrsHO
 Rf5xOVlOdsXdFsJ6KkMxCIA4eLbvsV3y1A3aUjwOrCJtYncFHh+4dTpOwHKi3U4ipCCTr8+SiVL
 4l1UHfVe7jCI66t0hLwCiMo6t2L2uOn1ogEb9C4aknkn0vRefjaoWB0mXL71Cy3Q=
X-Gm-Gg: Acq92OEztomyzp1fydKt2mm0fnz3fj4oQJ8ppQTUXaxFVLhsw/cTNqWlsmyAHuMwu+u
 d3GiSh2PZDPEcWfJ+yJu410I5lof5wsw1T3ueVvkRI0X+DQMuqGXbEv0oBul9PwBWvkmfUfI2pC
 /WTNPhXhyoZDxriR6X4PoagpCAkatETERmvV/WJVzLNc3Q9DRK9KZ0k9ILmzedCPLpFkMo5ud7V
 n6CRNuhFEiREb4nNLASzJ+Dw/kh5T+/Rq4FuCKBp50aH2xzc+LVChVj1mp/LFXOU3plO0bpPZW4
 U0GqlnHAeoIZLq9+TlhpphMfxIdPa1hJoGYESHVHXPOmaSMBvV8qYrb6rf4KvacGir2VF7YGUiP
 xnqcrrQ1iMaCiq3G1vBbvKD/951H2FwTzzQPGYGXApKKvP9EnNlfsLKFboABrB3nIOMfrxQNgd2
 skY3di4uDDG5CyvbAtLpv8BNlh7Dc=
X-Received: by 2002:a05:600c:1c0d:b0:48f:d612:3c59 with SMTP id
 5b1f17b1804b1-490424b3927mr364696665e9.9.1779818220004; 
 Tue, 26 May 2026 10:57:00 -0700 (PDT)
X-Received: by 2002:a05:600c:1c0d:b0:48f:d612:3c59 with SMTP id
 5b1f17b1804b1-490424b3927mr364696345e9.9.1779818219652; 
 Tue, 26 May 2026 10:56:59 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.251.208])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d4ca0dsm37040170f8f.18.2026.05.26.10.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 10:56:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH v3 14/19] scripts/qapi: allow passing multiple segments to
 mcgen
Date: Tue, 26 May 2026 19:56:13 +0200
Message-ID: <20260526175618.227743-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526175618.227743-1-pbonzini@redhat.com>
References: <20260526175618.227743-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nt-YDnRXnz75grZJr7gv_jUlPu_q1l6ccueNeXadoLs_1779818220
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

Make mcgen more flexible to allow for easier removal of empty lines.
For example, in Rust you can have #[cfg(X)] lines that would often
be empty; let mcgen remove the whole segment or at least the empty
spaces and lines at the end of it.

Separate invocations of mcgen still preserve the empty lines
between them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/common.py | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index c75396a01b5..44229c2e366 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -172,10 +172,24 @@ def cgen(code: str, **kwds: object) -> str:
     return re.sub(re.escape(EATSPACE) + r' *', '', raw)
 
 
-def mcgen(code: str, **kwds: object) -> str:
-    if code[0] == '\n':
-        code = code[1:]
-    return cgen(code, **kwds)
+def mcgen(*code: str, **kwds: object) -> str:
+    '''
+    Generate ``code`` with ``kwds`` interpolated.  Separate
+    positional arguments represent separate segments that could
+    expand to empty strings; empty segments are omitted and no
+    blank lines are introduced at their boundaries.
+    '''
+    last = len(code) - 1
+    result = []
+    for i, s in enumerate(code):
+        if s.startswith('\n'):
+            s = s[1:]
+        if i != last:
+            s = s.rstrip()
+        s = cgen(s, **kwds)
+        if s:
+            result.append(s)
+    return '\n'.join(result)
 
 
 def c_fname(filename: str) -> str:
-- 
2.54.0


