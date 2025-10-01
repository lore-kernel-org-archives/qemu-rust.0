Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85733CAC5BB
	for <qemu-rust@archiver.kernel.org>; Wed,  1 Oct 2025 08:05:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3rmc-0005qH-T7; Wed, 01 Oct 2025 04:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rmb-0005pK-4J
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rm9-00067h-LO
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759305682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UBV2+VUG7I4eiMBuAImYuaKckuDbq+FYw4y9UTZE5Xs=;
 b=hI6Ml7dVtLW1KRDqzZUA3Fi7rbaj55mppYPVTVoYXoyEy16Ir44KO9sZ49/8fq1lx/vZGx
 260AJeR1zl7k6G/gSym7IGiM3s7OZy5bg8TZE01YYbG8NSnnr8jmSLXyzDKcZFoW/JYAVS
 D18+wGq5eKY9venm6y5njtktvn4puFk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-mnSThpGAOnW8xCVs_iV28w-1; Wed, 01 Oct 2025 04:01:21 -0400
X-MC-Unique: mnSThpGAOnW8xCVs_iV28w-1
X-Mimecast-MFC-AGG-ID: mnSThpGAOnW8xCVs_iV28w_1759305680
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-636260bcc31so3737280a12.1
 for <qemu-rust@nongnu.org>; Wed, 01 Oct 2025 01:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759305680; x=1759910480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UBV2+VUG7I4eiMBuAImYuaKckuDbq+FYw4y9UTZE5Xs=;
 b=a0+1Q65jIr52GSg71Cx4RZNitygrp7FKmXoMPT6VFy4Pa68X0U0l80QIFA3/dRMYA9
 mkzfbwwFo7UcppAjHHIKMaVfqnVfXhw7jV1HQ4++qfQREVKiBEdnDnq5Il01kOlrtdLM
 VQTZ+xv20IxvbmNwnBvwXvl6g3d8l3UV+BI+Mi1yS5m28EtSi4W/4HucVw/TQWhQdn3V
 ie11/SwmEhc+retobUhuNA/Ivvx99+/GRbVL1hgZBxyKlHwWkWdlwlyoMXqZ9cN4ZK/w
 KGn+/nL3MwUbwk1VFn+/LwiNSyMxkbATtcN7OAkEL3B628Z5Oa+YVuxhYo2M+rvVgvbi
 57zg==
X-Gm-Message-State: AOJu0Yyu/xoVOLjviSduIsUgfhwNe3VwwsmB9lxdJute4caUTN+WN8js
 psGzCDZIorf5a/J7/V4QhaWj+yrBg37HFyJXLDYo+69X3W1SuUabvkxtaZH6LevQoHpWaAKyi1b
 ZlmBfNeqEw9a+V1tGH1Zc9bHjpT5R9jJ3uQnjRYDKbJuEa2w1TEwD23E=
X-Gm-Gg: ASbGncuc+N2eIoK1RufYPg8pK5llDbK7t9J4ozboPcyvPKpa8JVQ1p4mi/ND95wefbM
 LVX1QnQrwuhQRbqSonwGJyC+65yuW7VdaYWjJp+7GBcy4Cz61e6aUBlUvS3d5PWDfjMK5WBBnBx
 CYktLoUhFUWtPP766hJbSRN/FbRm6jiSS/draZwow9sUqxmRPf8zqJApXpbOKeofZqDlJ9Pfrto
 9tkuKTlkc1hupRXfsqflUaWMY6twKEwrrQL/els3pgQSiJs/PR5SDINqBxLdl1aq1lGXJMULj7h
 o3XDSouMVZqZt46zWE5bvn4G3Wts1/aOnyX2cGKBDLgq67AM3AEyQ69jFSRG0OuTq2XrD+m1AuV
 +CRDaO9K3ElNCXC78knWLQ3AiW16U1rD62mpqpp9htAdfL02P3W0=
X-Received: by 2002:a05:6402:1ed2:b0:62f:26f8:fea0 with SMTP id
 4fb4d7f45d1cf-63678d17dc0mr2956884a12.33.1759305680120; 
 Wed, 01 Oct 2025 01:01:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8PHvbN/g5zE3FC0Re6MrrE8LISYk/O5fL4TgbzcfB9SPdymwICxoWP9rm7OKbfkdScQO4bw==
X-Received: by 2002:a05:6402:1ed2:b0:62f:26f8:fea0 with SMTP id
 4fb4d7f45d1cf-63678d17dc0mr2956852a12.33.1759305679749; 
 Wed, 01 Oct 2025 01:01:19 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3629cbdsm11315900a12.3.2025.10.01.01.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 01:01:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH 11/14] scripts/qapi: strip trailing whitespaces
Date: Wed,  1 Oct 2025 10:00:48 +0200
Message-ID: <20251001080051.1043944-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001075005.1041833-1-pbonzini@redhat.com>
References: <20251001075005.1041833-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AfrWpsypJU0WG8HarCCytzMEi6yMkqrsF4-mtcVyUuo_1759305680
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
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This help workaround a rustfmt issue.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Link: https://lore.kernel.org/r/20210907121943.3498701-16-marcandre.lureau@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/gen.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 0c9b8db3b02..c9721545ea7 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -58,7 +58,11 @@ def add(self, text: str) -> None:
         self._body += text
 
     def get_content(self) -> str:
-        return self._top() + self._preamble + self._body + self._bottom()
+        content = self._top() + self._preamble + self._body + self._bottom()
+        # delete trailing white-spaces (working around
+        # https://github.com/rust-lang/rustfmt/issues/4248)
+        content = re.sub(r'\s+$', '\n', content, 0, re.M)
+        return content
 
     def _top(self) -> str:
         # pylint: disable=no-self-use
-- 
2.51.0


