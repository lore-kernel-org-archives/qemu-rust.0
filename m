Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690A6C87FCB
	for <qemu-rust@archiver.kernel.org>; Fri,  1 Aug 2025 17:08:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uhtEm-0002zu-Kw; Fri, 01 Aug 2025 13:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1uhrFz-0008Tm-Qm
 for qemu-rust@nongnu.org; Fri, 01 Aug 2025 11:01:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1uhrFs-0000PW-GX
 for qemu-rust@nongnu.org; Fri, 01 Aug 2025 11:01:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754060462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EibVuCSVdCYENLhK7blxCV2Y6w9AUs61+n3Y7kOCbV0=;
 b=izDL3Na4cUIKDaev3F+q/FhB1NTFI63bXumVBx4STKl7XdMUOfkc31PDY7S3fq/UZXaJat
 8v4D5BGx/z4uiuILSWWJA04TkLsktoQdtmDsbckYMkur2EReasmxZHemMbB8kaSYQXDO1A
 DeljreexjvFuxWZ2AzWUPkyR0a5rZG0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-E_8BMBR4MLOx3VUbpAK-NQ-1; Fri, 01 Aug 2025 10:59:54 -0400
X-MC-Unique: E_8BMBR4MLOx3VUbpAK-NQ-1
X-Mimecast-MFC-AGG-ID: E_8BMBR4MLOx3VUbpAK-NQ_1754060392
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-455e9daab1cso5381095e9.1
 for <qemu-rust@nongnu.org>; Fri, 01 Aug 2025 07:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060392; x=1754665192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EibVuCSVdCYENLhK7blxCV2Y6w9AUs61+n3Y7kOCbV0=;
 b=mLBVsJTorHKODBAHReDwUZ1nrd7/+9g54msfWgnipCQgP5d5LNzgME0XG8XU7dlWNw
 Tg/BxKBk9Dp9usKqh82LxaxJy0gREECQILkVBGXDayMG3aL3+pdTPhprofEXgo3XQduR
 14jtXtRz/P68BHIWNoV3Av3Y7BTUO4ZFAjxQPtfoffe4vi2D12R1EE+lRBO3MF7F8D37
 c71EjImSUQldwEZte0ZyG0Zk/iTjBwO5oOqa+rg+NY9+PyhGZJmNgWR9LgOSzh757/Uj
 KY1ZQBskHVENRUDVYPFCmsBT9PFssYb9n9jyYR00Fnl0HBbKE8IdZN6+HoWyLz+u42i2
 v1jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxJJst44MZJmLcv2vfLtwdThAks4SK0KaojGtvVxYiKXEkqAdx2VtAxRW1fa2NmHLWFwHamgwsBoY=@nongnu.org
X-Gm-Message-State: AOJu0YzYWNPY1RNBS+ahgcZ7yMv0LNqz5DA8gULSYvP1+iGyYQVQFeYj
 VOOw6U7vSTV6pYXWb2ZKFwgznC1+1rjgnZXDPE/0wgWXJ9+m3sp8fpROIOedvzFRPSx44zSy9ey
 BIy35/7b/2jmQ8NWmxSPrkoEw0mkeihNcY181ifNL5PLMqUYExzWsLCE=
X-Gm-Gg: ASbGncsV6pbagIu2Cl6aRfm+Fni2i4nvOv3Hjf4PxKzOyYoJsMRdEozhgBilzFxXMO+
 cyQobf16Ld9dfD8EGJYLwN+hwtV8aOjw61nAyzZAthB+FeEwtt6oy57TAOYCVjXfxYfdWofxCVB
 WFcWjCQvolP5vBA8b010Gcj4Wnc/0XybQBePP7RD/PFGai6KBTBFK8hSbatCPOTs/DwmcnwOnMi
 eCoS/xM6Qb1s5DG8ec8p8p/Sc89Fi97w9VcLl0OEjqWQ7hewLKlunjFnoVMIAfKPAH+cxXjqYU/
 XdismF02GWScahbrEs81XCr9HwQl6wiqSo4yVy0/BWlBdNa+
X-Received: by 2002:a05:600c:3d8a:b0:453:8bc7:5cbb with SMTP id
 5b1f17b1804b1-45892bd25ccmr95682615e9.25.1754060392375; 
 Fri, 01 Aug 2025 07:59:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxtLMlvr/im4oRN86Y1+kZifI2XKIK2rD2jsWWmUfe0udhilMIsSrvBePZfJq/lzhyTl7QVg==
X-Received: by 2002:a05:600c:3d8a:b0:453:8bc7:5cbb with SMTP id
 5b1f17b1804b1-45892bd25ccmr95682435e9.25.1754060391923; 
 Fri, 01 Aug 2025 07:59:51 -0700 (PDT)
Received: from wheatley.localdomain ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453c80sm6124714f8f.43.2025.08.01.07.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 07:59:51 -0700 (PDT)
Received: from wheatley.pinto-pinecone.ts.net (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 14071C5A9A3C;
 Fri, 01 Aug 2025 16:59:51 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 0/2] Few fixes I found when building QEMU with Rust
Date: Fri,  1 Aug 2025 16:59:48 +0200
Message-ID: <cover.1754060086.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Gz9Y0JWrp6yCayW2KHCQupQ6sQNLNbzLRekm-jGp2DU_1754060392
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 01 Aug 2025 12:54:23 -0400
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

I'm fairly sure the first one is alright, but I must admit I have no idea why is
the second patch needed on my system.

For both patches, please take them with a grain of salt and feel free to prove
me wrong with anything.

This used to be a bigger series until I rebased on top of Paolo's rust-next
branch and basically got half of it for free.  That's why these unrelated
patches are bundled in a "series".

Martin Kletzander (2):
  rust: Add antoher variant for impl_vmstate_struct! macro
  tests/qemu-iotests: Indent expected error messages

 rust/qemu-api/src/vmstate.rs         | 11 +++++++++++
 rust/qemu-api/tests/vmstate_tests.rs |  1 +
 tests/qemu-iotests/039.out           | 10 +++++-----
 tests/qemu-iotests/061.out           |  4 ++--
 tests/qemu-iotests/137.out           |  2 +-
 5 files changed, 20 insertions(+), 8 deletions(-)

-- 
2.50.1


