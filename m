Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2636AC5DF66
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Aug 2026 14:16:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wvy8L-00062G-Un; Mon, 17 Aug 2026 10:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wvy8D-000614-Vw
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 10:16:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wvy8C-00015x-FC
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 10:16:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1786976163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0sGxW77N1apK5FTIjQOUHP3l5zsQw09WjtabparSqCU=;
 b=QeQ6V/Z/N0SU2k70taqZDBsQQEweMZNz8tvAIo3wfnnTV+dFM78qlaKUN5cTBfWlGDREg8
 jAE27QC/mgP14K+ZB6A+Dx2oClilWxgI7wtPJ/EWmLr22HayRPfUsx3POxdp7NGVruECfz
 ecJcH6V1eWtotbdjt2aGvICHXcqUPuU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-6CLNdAgIN3i4k5DwvHXtfA-1; Mon, 17 Aug 2026 10:16:01 -0400
X-MC-Unique: 6CLNdAgIN3i4k5DwvHXtfA-1
X-Mimecast-MFC-AGG-ID: 6CLNdAgIN3i4k5DwvHXtfA_1786976161
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-499574e98a1so22455605e9.3
 for <qemu-rust@nongnu.org>; Mon, 17 Aug 2026 07:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786976160; x=1787580960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0sGxW77N1apK5FTIjQOUHP3l5zsQw09WjtabparSqCU=;
 b=BZWWSWUHOP6h0wLGxHpoHX8kYMELr+QepeoNE1RSZOFDFfTmJk0QXqcCisMpJJtkZN
 7W2tiR9TlT4lhiQ2kETWuWL62x5ntlVB9ECjOzDYB0NaCDYKpHcev6LtraSxEBW/5KvU
 awpOXRMHCvpwp0dABX+pajcTYhaBc2+NGoJt/wTwSmkVtEgR/lNmecGPUNjGD2bMCzmp
 UTllW/53DLfvWC4tuMYQ9vMbJIB1aZ6YUuLa6ZiNlDjvE1zONqytTdLMFcVUcSXgx2R/
 HyDHhPT7LYDEqE8A3Hi3UOw8VLdHgsuIa0+FbxhlT1+40JD5BXGqMrhgH+UNKCUEtLvK
 TGpQ==
X-Gm-Message-State: AOJu0YzovErRwd+kpjG4FZN9lBzEumnSU3B1n/AztkJZm73t57fwmRq7
 yVbwM0srfrHsIxPqux4H3z5mJY/BIKa3k1L7tNLs0JUNdLfbP6VM3kSGJmGGfoUVMUbGGikaW8i
 6qesLGbi4JNVDD4p2lruFJX51vYcrqcvZXgA9HVQaAcwRLo4k1OuVAgmWZe/Mlh0=
X-Gm-Gg: AR+sD12JCdhwNAP+BMJ+9wLrfFUt/cNRmyiVgrW4MlCuPMJBx+cOk5BX7TbphQIsDUd
 i9hQNrYxWXpQ09fA5tdiQZUBPuAvJ99Rfzz/9bGzPT//LWZ2CjkYKAVTIed1rp7YVHj0mttiNGW
 oeO981NN6t99i+d+CjPdL/ZN0O1G3BhaJd/KaT+krRHZP1fmgtzFJ4egzdVRSA7AhmjNBw3ihZG
 YXfu+8+s6HvSkKx7fMe6JrJk+T52fJXdARmxO1iWMUWU+Rr9Jj2xw2zW7L0hOWsSzcy8aGwwilS
 GrsjRF2mw8QOFVq6+eLfXrWPPOSBgn874HQK6wpFVabwCrTOOtY5vBF2qOBiQWYhNyjbGTnlRXo
 PkyTIQStauBgNAt3qa2rrqgf4T+V1KC/Wa8wgdWOzlvrRhfgmPU7WUFURw2qCIJZZoZTd99qi3m
 yPkOE=
X-Received: by 2002:a05:600c:1f91:b0:496:bffb:fb7b with SMTP id
 5b1f17b1804b1-4999fb3c2e1mr6780855e9.10.1786976160528; 
 Mon, 17 Aug 2026 07:16:00 -0700 (PDT)
X-Received: by 2002:a05:600c:1f91:b0:496:bffb:fb7b with SMTP id
 5b1f17b1804b1-4999fb3c2e1mr6780285e9.10.1786976160179; 
 Mon, 17 Aug 2026 07:16:00 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999618acafsm124202635e9.14.2026.08.17.07.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 07:15:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 0/2] rust: switch from bilge to bitfield-struct
Date: Mon, 17 Aug 2026 16:15:57 +0200
Message-ID: <20260817141559.940844-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Loy6H24bibeP7UjlnlwMzv4VJ6F3kGlF3ztz21L0L-4_1786976161
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.343,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The bilge crate is heavily reliant on traits and, because trait functions
are never const, it does not work well with const; also important is
that bilge's support for the zerocopy crate is tied to an older version
and has never been updated.

The bitfield-struct crate, instead, is built from the ground up to
support const, and has much simpler code with fewer dependencies.
Its use is pretty much the same: device code does not change at
all, only register declarations do.  So, switch to it before it's
too late.

Paolo

Based-on: <20260817134538.924615-1-pbonzini@redhat.com>

Paolo Bonzini (2):
  rust: pl011: switch from bilge to bitfield-struct
  rust: remove bilge crate

 Cargo.lock                                    |  71 +-----------
 Cargo.toml                                    |   1 +
 rust/hw/char/pl011/Cargo.toml                 |   3 +-
 rust/hw/char/pl011/src/registers.rs           | 108 +++++++++---------
 rust/migration/src/vmstate.rs                 |  45 +-------
 scripts/archive-source.sh                     |   7 +-
 scripts/make-release                          |   4 +-
 subprojects/.gitignore                        |   8 +-
 subprojects/arbitrary-int-1-rs.wrap           |   9 --
 subprojects/bilge-0.2-rs.wrap                 |   9 --
 subprojects/bilge-impl-0.2-rs.wrap            |   9 --
 subprojects/bitfield-struct-0.13-rs.wrap      |   6 +
 subprojects/either-1-rs.wrap                  |   9 --
 subprojects/itertools-0.11-rs.wrap            |   9 --
 .../proc-macro-error-1-rs/meson/meson.build   |   3 -
 subprojects/proc-macro-error-1-rs.wrap        |  10 --
 subprojects/proc-macro-error-attr-1-rs.wrap   |   9 --
 17 files changed, 71 insertions(+), 249 deletions(-)
 delete mode 100644 subprojects/arbitrary-int-1-rs.wrap
 delete mode 100644 subprojects/bilge-0.2-rs.wrap
 delete mode 100644 subprojects/bilge-impl-0.2-rs.wrap
 create mode 100644 subprojects/bitfield-struct-0.13-rs.wrap
 delete mode 100644 subprojects/either-1-rs.wrap
 delete mode 100644 subprojects/itertools-0.11-rs.wrap
 delete mode 100644 subprojects/packagefiles/proc-macro-error-1-rs/meson/meson.build
 delete mode 100644 subprojects/proc-macro-error-1-rs.wrap
 delete mode 100644 subprojects/proc-macro-error-attr-1-rs.wrap

-- 
2.55.0


