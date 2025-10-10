Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE449CCD18A
	for <qemu-rust@archiver.kernel.org>; Fri, 10 Oct 2025 15:10:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v7ElM-0008Ib-Ef; Fri, 10 Oct 2025 11:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7ElJ-0008HY-MR
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:10:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7ElA-00043H-MA
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760109018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G/xFnT8f0DpAhs4XBkL1hdT97m682bWgM6Ej0zAVW6U=;
 b=HKpFvctKHGqPwLO9sLOpZDUx9LaWm1trTcvOO2julu/ybg0ezIlvPYwHsotGz64oju19AB
 ayyCy2FZWu3YPzGhI0qzbJNHQCGCt7v56pRuWme/6gpFFYENkuhIe0bY5rvGH/DvXR0U9K
 LlGT3KPVXL5ddxI01YT27rJM1+kMzsI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-GoK13duBMmO0T0bhSuBFKw-1; Fri, 10 Oct 2025 11:10:17 -0400
X-MC-Unique: GoK13duBMmO0T0bhSuBFKw-1
X-Mimecast-MFC-AGG-ID: GoK13duBMmO0T0bhSuBFKw_1760109016
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-afcb72a8816so179513366b.0
 for <qemu-rust@nongnu.org>; Fri, 10 Oct 2025 08:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760109014; x=1760713814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G/xFnT8f0DpAhs4XBkL1hdT97m682bWgM6Ej0zAVW6U=;
 b=vXs6RSKC5ZdTs4dEpONv/kbOuO/PQwFqz6rsDhCEoDx5BUitpFtt7q01+pQbeWlhbj
 ojXzCFaynd9fkgUCpNhbPUOya/ccn4t8hgS1Jvjn3l8EqzABHC/CmNr5oSDQS9cSRY74
 MQagB8A63/omtVvxgZqLV6Ls6bq0J2bdawX83cNWmRjUP5QUdAVvgno80C3e3jtHEE9x
 J2ERQKgPfRr0T3JWfUzeA25DLI1n6koFJ5v7/42TwSqu4t6mxSRVkdYU0f9iBdK8WcJ0
 I+u/nZbjQFgV77GLuEoLFuFEnF+rkFbXJdLbSES17vC7ip8WGqT0n9HjQhSV7YEtleR9
 X+nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlauDedvHs3ZW8dDPQ8VE4T5CGzo4ga5BlpYqDVcpHNq/eMpK9b5euYL+O4qp5T4kpZvG2pHyooNw=@nongnu.org
X-Gm-Message-State: AOJu0YxU8M9b4pO3c1KO487W/wk/W5p5pfRw1G6/7KBv8zTiRicvfho0
 uMuQDy98QE1sQUMLd13C/NLz58t9eWISt+6l3t9UI6CgVgP91dziHncqND9bDwOqY83FJmvbdRy
 LMsXuIsvnL3Yir+4viECPimOsjskva3JfF/0xgMILIfFiIqx0dJ33O3cAr9zEhOU=
X-Gm-Gg: ASbGncuL3M7Ou4XTgYhrkO1JPkQFdp29EtxGR1xFymGIc1gbPaHvxqZcy0X24EJCfgQ
 iZtEw7+wlGkFmUGq+KyLRzYrtQ/uFfF9rtjRJIO111kqb8SSVv9/X4mz8z+nm9cc7rN3s2aqOqk
 KUQkbucztIyC1FNbJvrczcy/E692bHFaQ9R+Na023jdAWvlhgcMKNm6T43ZKYQnRYaikLCT0S8R
 7SGGBtlsQAUCyXfpA0u46/XQgkj+9J7DLqGxDZt8LoVQJhSJ+gCafob6naBdMdDPD6zmv/WEck9
 kKpwXcrOkU7NazRqIdxNdSsqsYuoGSYzcyEzScP6MEP2//duMxoAe2ZvQGVOxBEycBRkR2Nfmx9
 gGY4LMnwgOjO3j/mOzhaobnb9nrketPvCmQzbBfcDSrmK
X-Received: by 2002:a17:907:96a9:b0:b33:b8bc:d1da with SMTP id
 a640c23a62f3a-b50aa491efcmr1327481766b.1.1760109014399; 
 Fri, 10 Oct 2025 08:10:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWpvnoj2yV3OFPQlzNEULVZJYZM5xsvAJtnsLekGyDi5wRdbb2YipTV1Uj1mIqqNmOWjNRwQ==
X-Received: by 2002:a17:907:96a9:b0:b33:b8bc:d1da with SMTP id
 a640c23a62f3a-b50aa491efcmr1327478766b.1.1760109014021; 
 Fri, 10 Oct 2025 08:10:14 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.231.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d900e2bcsm248932966b.64.2025.10.10.08.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 08:10:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	marcandre.lureau@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 03/19] rust: do not add qemuutil to Rust crates
Date: Fri, 10 Oct 2025 17:09:48 +0200
Message-ID: <20251010151006.791038-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010151006.791038-1-pbonzini@redhat.com>
References: <20251010151006.791038-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sXuo3zm9ejmEaWnQ0veMHdoBaUaolRUvcnBwy6jgDSM_1760109016
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

This fails due to https://github.com/mesonbuild/meson/pull/15076.
The config-host.h file from the qemuutil dependency ends up on the
rustc command line for targets that do not use structured sources.

It will be reverted once Meson 1.9.2 is released, or replaced with
an update of the minimum supported version of Meson if 1.9.2 is
released sooner.

Reported-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/chardev/meson.build | 2 +-
 rust/util/meson.build    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/chardev/meson.build b/rust/chardev/meson.build
index d365d8dd0f4..36ada7c4546 100644
--- a/rust/chardev/meson.build
+++ b/rust/chardev/meson.build
@@ -39,4 +39,4 @@ _chardev_rs = static_library(
   dependencies: [glib_sys_rs, common_rs, qemu_macros],
 )
 
-chardev_rs = declare_dependency(link_with: [_chardev_rs], dependencies: [chardev, qemuutil])
+chardev_rs = declare_dependency(link_with: [_chardev_rs], dependencies: [chardev])
diff --git a/rust/util/meson.build b/rust/util/meson.build
index b0b75e93ff6..8ad344dccbd 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -43,7 +43,7 @@ _util_rs = static_library(
   dependencies: [anyhow_rs, libc_rs, foreign_rs, glib_sys_rs, common_rs, qom, qemuutil],
 )
 
-util_rs = declare_dependency(link_with: [_util_rs], dependencies: [qemuutil, qom])
+util_rs = declare_dependency(link_with: [_util_rs])
 
 rust.test('rust-util-tests', _util_rs,
           dependencies: [qemuutil, qom],
-- 
2.51.0


