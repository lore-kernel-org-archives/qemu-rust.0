Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F43C5DF8C
	for <qemu-rust@archiver.kernel.org>; Fri, 21 Aug 2026 08:40:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wxKmt-0004uz-4e; Fri, 21 Aug 2026 04:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKmr-0004tW-4U
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wxKmp-0008Il-KX
 for qemu-rust@nongnu.org; Fri, 21 Aug 2026 04:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787301579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BNT4gCVRYyaXj9erYrsb5EQE1LH/A5pl3a3ZixZaCBM=;
 b=HSCO2tOaExhYoIknCBqv/dO+nipbfkv9iQZaohnCWQ3DpiKzzY+8z9oWBYcVrT7IdBWaWL
 xdbOZCB+4gCDff43vqL2fdkPGiByJawR1tdayMNIzWYCno+lYYw4vfJPwW69Na2PaIPGBh
 5Y3Q5MLaqEZkQtziQkgWp6harKOuLCs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-v0oenop5OzyC59qVCKTL7A-1; Fri, 21 Aug 2026 04:39:28 -0400
X-MC-Unique: v0oenop5OzyC59qVCKTL7A-1
X-Mimecast-MFC-AGG-ID: v0oenop5OzyC59qVCKTL7A_1787301568
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-c15ceb17a28so53873666b.3
 for <qemu-rust@nongnu.org>; Fri, 21 Aug 2026 01:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787301567; x=1787906367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BNT4gCVRYyaXj9erYrsb5EQE1LH/A5pl3a3ZixZaCBM=;
 b=obEft9OTJlC3vrwJXB67VP0EfkplVf/X7yljEd04JgHVwe8sIaNQ7FPpreBRG+IVXP
 2xRBj5XekgumvFH9MBeQmjbA2/U/oy2yAhbrwrwWRRROMp1yCErgxG9BHKIgTeKf2lqa
 rp9WoQPOuUeQXD6C62K3BNDyK+MG5z5Kb8Na8fwbR6ECfrmHXvvhZnyIztXs7rorvtBQ
 Gi+ka31d1xue+TxBW1KTox7MEfI8OUlEN01OAFqDArtbXwrNkmfxKzoFFX5afNdsqYLU
 Re+9DmHqbkX31yVjetM9jr5OR1lKuTIOUbwLZa04wKTfEBNXycFCS2OHbfAqmCV+h5Fe
 ybaw==
X-Gm-Message-State: AFuF++kwRDLpr+jtn4VVIPhsBCZ6PprRu/OImZ7gNsGJqmkkMTqOKu2k
 goL7huuWoI9sHytEp8r/3nawLRwG4XaM4ZIz39H7VYeeEeBZ5vNzGyK6kNR3elxKoiZ+n5EGJxA
 FFejj/YLS9L7U3Z8is2p4cu+lv2WYfOjMuSaqG5Tkw/yEgdDUDFrtQAMtN7FZGZY=
X-Gm-Gg: AR+sD12GAn6iQjs1LmD5Tpakzl2Jex46j9rJAW22jOZ7QWHZVxPYrq8X25Him22pb9q
 /uZ7BKl5O2DN10FfYqEa7NDasa04Qq//R5kSJ48uIqffa6ZuDtUhGsSm1HyIFVEzKCFbea2EDuM
 /G5iCMy3Wqr7HFKC2fe5TWf2JPYZcdftR2qgMOmyphDdhsWAjBDPnqvEVEV9u9co7hKvdJK+IU5
 2WwiP8IehdZRdiHzJiaKZn0z/TPnEJ/4RivWAtxOI7MTMQ8VJ9Ouo3WRNsZvlsVMhFRhi3n3l9m
 2YRfkFe7DxVVQEH1zPB3N9GYsjZGfe04WuAp7zCkcSlULlGPYSsC++CiHpRlJEyuZ5xol7EUSDT
 uIFHAhTg2J1yscvgwMzg8uAvme/5/s/jM+3Pcx2t1LYhhxDXKiwN0jIayAPIxxQ2qwEjVmY75P9
 jQYJg=
X-Received: by 2002:a17:907:a4a:b0:c20:3733:a8c5 with SMTP id
 a640c23a62f3a-c246a36f311mr404132466b.8.1787301567646; 
 Fri, 21 Aug 2026 01:39:27 -0700 (PDT)
X-Received: by 2002:a17:907:a4a:b0:c20:3733:a8c5 with SMTP id
 a640c23a62f3a-c246a36f311mr404129066b.8.1787301567194; 
 Fri, 21 Aug 2026 01:39:27 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2459197cc9sm368635966b.31.2026.08.21.01.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 01:39:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 0/9] scripts: introduce script to update cargo .wrap files
Date: Fri, 21 Aug 2026 10:39:15 +0200
Message-ID: <20260821083925.2008135-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5wUK19glYQOkgIPv5QBHRh0Km2vmBuroU1Udb5QNV8k_1787301568
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.346,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Another small piece of the usability puzzle for Rust, this time
tackling dependency updates.

Extend the existing scripts/get-wraps-from-cargo-registry.py so
that it is also able to use the versions in Cargo.lock.  This
makes it much easier to update .wrap files after running
"cargo update", though manual work is (intentionally) still
needed when the semver of a crate changes.

It's possible that this functionality will be moved to Meson either
wholly or in part.  As usual, introduce the prototype in QEMU so that
it's clear what is needed.

Paolo


Paolo Bonzini (9):
  scripts: print build.rs diff
  scripts: rename variable in scripts/get-wraps-from-cargo-registry.py
  scripts: do not assume the new version of the crate is present
  scripts: prepare for introduction of CrateSource class
  scripts: introduce CrateSource abstract class
  scripts: add functionality to update wrap files from Cargo.lock
  scripts: add the possibility of a quick update of the pacakge
  scripts: rename get-wraps-from-cargo-registry.py
  rust: update crates

 Cargo.lock                                    |  48 ++---
 Cargo.toml                                    |   2 +-
 ...argo-registry.py => update-cargo-wraps.py} | 198 +++++++++++++-----
 subprojects/attrs-0.2-rs.wrap                 |   9 +-
 subprojects/foreign-0.3-rs.wrap               |   9 +-
 ...sys-0.21-rs.wrap => glib-sys-0.22-rs.wrap} |   9 +-
 subprojects/libc-0.2-rs.wrap                  |  10 +-
 .../libc-0.2-rs/meson/meson.build             |  20 +-
 subprojects/quote-1-rs.wrap                   |  10 +-
 subprojects/unicode-ident-1-rs.wrap           |  10 +-
 10 files changed, 207 insertions(+), 118 deletions(-)
 rename scripts/{get-wraps-from-cargo-registry.py => update-cargo-wraps.py} (38%)
 rename subprojects/{glib-sys-0.21-rs.wrap => glib-sys-0.22-rs.wrap} (13%)

-- 
2.55.0


