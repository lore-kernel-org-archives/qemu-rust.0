Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE0CCCA476
	for <qemu-rust@archiver.kernel.org>; Fri, 10 Oct 2025 15:17:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v7Emi-0000ml-Co; Fri, 10 Oct 2025 11:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7EmX-0000gC-Uv
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:11:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7Ell-0004C5-MJ
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760109051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UBV2+VUG7I4eiMBuAImYuaKckuDbq+FYw4y9UTZE5Xs=;
 b=NPfp8pmt6oCYgaRwOK9OlYVm9O+aTqnqhQlfjY4hpQ/IsuAF7kVl7VcQT/UKiwF95NN8YS
 wgZrkBdEcgVsvkD0Xek0Lyb/m4lP93EkVyznxZL09tjAdu4sQ81XRSBHr4GKm4AeN91Jcm
 Rj7b5GoVo9e0+ViTV8cSbSl4FDvq1e4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260--vKOrIwuMxSFT-iB32Z_QA-1; Fri, 10 Oct 2025 11:10:49 -0400
X-MC-Unique: -vKOrIwuMxSFT-iB32Z_QA-1
X-Mimecast-MFC-AGG-ID: -vKOrIwuMxSFT-iB32Z_QA_1760109048
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b548c516b79so214236866b.3
 for <qemu-rust@nongnu.org>; Fri, 10 Oct 2025 08:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760109048; x=1760713848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UBV2+VUG7I4eiMBuAImYuaKckuDbq+FYw4y9UTZE5Xs=;
 b=kqlMEBahuWsTwEciXheaqJO1i1quFC5aoqReNnQ6QYNr4ZOuZHIBX7VU6B+zCuhP1B
 1aQsvLgwk0QPyEQzAVu/qseTbJta+1pQ6fIT2/RL3XkKgyOkgsKg/hQQXekM+A/rbkw/
 TQoMHViCl1OjUeI+/x+GTlIpXVdwD6tpUyil7o+ayQ4MQizJMWNtYqfQizXw3fvv9zIi
 i1dagLeMjzQRFGBV8RnrWFO+bvLB6Pm+tczbpwQEFENRngoa/GlbonXoPmNMDFKLURsV
 423TX4Z/qRdExXpGVpvIxu5UKnciW+VHunE3KR3HrXUAfazfL2hEB+h9EPxSkEEdzjaJ
 9+Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/FF6i8tosRwaBo/MiL1NbIQyb/EwWiuPF/AsDG6rULlQgHKnTGzR+3ZmShG34cBQ51F3x//GZ6HY=@nongnu.org
X-Gm-Message-State: AOJu0Yz+I/4svbv8NOXd/1JeQttpVQwz8VatK/2IPOSxA02DhRWtmECk
 +E60ey6jAyuPMm+TPJC5nHrsswgecsTHIJTLzi+0uC2spPFFQBBq6CN07QKr1ST4gQN8KnB0vhC
 H3WKNgiwtfYSJNS3pM5CwcaT+J41hMfI2kMnlgdo5LjnIU6ESdx4dzKc=
X-Gm-Gg: ASbGnctNLwtzVawAX7K0s6OcLXrxWC6V0FAd9m12jidAjqwqX5FqGNubPaeTbi6h8bv
 /7QNOXq1Ue96MdcYg8pmaUxvf9Q/MH9z+e16xLq/ZVTbqwpftZ3CDXHaD4Q2jB5JFkPO6Mh3l7x
 hizSYsD0sLgYW2bldYLpy41nZp/GWCrJbEWSkXgaR/PO3YZ2A8HUowZNiD14fQfkVKuqYNbPM1I
 RPlLE852TNJM52yW4lnrmSMWlDFlEser9xOCuMme1CQ+41R41PFw9ttU3KL9pwu9zgIgKyYmLPJ
 n3LkvaToZLzqnUqzVjEfV/yX5OITApiKtwm9K6UFGT/b4IWzSq19ho+AMMOavGmdED7U5NvEY+x
 FHFU1/JdIZ+vt11BjYSpwFLL2LrbDPD8E9qqHuzqikgw5
X-Received: by 2002:a17:906:c104:b0:b46:3dab:7dac with SMTP id
 a640c23a62f3a-b50ac6d274amr1159285666b.45.1760109048107; 
 Fri, 10 Oct 2025 08:10:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQJLLWmczUilmoE67+BLTRUznp0F4fknCSl/G2nWxPnjBPjf/d+Xi1YW8KApL96Vz/lh0K0Q==
X-Received: by 2002:a17:906:c104:b0:b46:3dab:7dac with SMTP id
 a640c23a62f3a-b50ac6d274amr1159283066b.45.1760109047675; 
 Fri, 10 Oct 2025 08:10:47 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.231.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d900e2bcsm249020466b.64.2025.10.10.08.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 08:10:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	marcandre.lureau@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 16/19] scripts/qapi: strip trailing whitespaces
Date: Fri, 10 Oct 2025 17:10:01 +0200
Message-ID: <20251010151006.791038-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010151006.791038-1-pbonzini@redhat.com>
References: <20251010151006.791038-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bl1Y3wH8kwU-BZHeV3Tnro9phdi288V6VcLVa-La7RA_1760109048
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


