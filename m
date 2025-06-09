Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uOefp-0000Lq-Em
	for mharc-qemu-rust@gnu.org; Mon, 09 Jun 2025 11:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uOefo-0000LU-P7
 for qemu-rust@nongnu.org; Mon, 09 Jun 2025 11:44:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uOefm-0007g2-SM
 for qemu-rust@nongnu.org; Mon, 09 Jun 2025 11:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749483869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L28jsPRClJo4OLLokxftqnXGEfNPrNBJD4KBjVYT1Gw=;
 b=ekSrOOby6xqh4fts63yqiUsSTYsn6S6tSBZ14OCZnuRnaBuoL1GMI1JOoxiChoJDJLcnQ8
 kTwTWiyaKsLR/Hj9z/LGXbPw04lELApQ5M+dUAfY3dK86VMQ62Ru1vk+VTImSfEsuL4VTC
 tr17AEswhIV0sqqg7GD2rLHSKJrhkkk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-CYTTIknVNWKDm5GVAlpK6A-1; Mon, 09 Jun 2025 11:44:27 -0400
X-MC-Unique: CYTTIknVNWKDm5GVAlpK6A-1
X-Mimecast-MFC-AGG-ID: CYTTIknVNWKDm5GVAlpK6A_1749483866
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-451d3f03b74so27140305e9.3
 for <qemu-rust@nongnu.org>; Mon, 09 Jun 2025 08:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749483865; x=1750088665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L28jsPRClJo4OLLokxftqnXGEfNPrNBJD4KBjVYT1Gw=;
 b=GWBG3qi4wdQcrGkK4g3rJeGdhvzah2mArqOEeTA4EGn8M77xCI1iT+k/wEsV5ldgaD
 qKXbAfdJFB+v6ZBNeiJcvTKrBzSclmaullTBJqolpOlXyM//JSLIsKsIfvP1oFHsYOK6
 H0/jXLGqMFlWkRLrJZiSX7qdIBmvdTDVrfAGKniEtY/wbpDhOVjE1NI2GEVqNRtRksNp
 A6/ecoNIYvarXLya21+gFDpMTTUs7yRl++KykYmKBLiM7pFISl80FLPbkXxMnZoBG/n2
 ILurU4StgjhA5o0fVdHjZkYSTGWmMmVUeKlrjp6JnFU++tIGSxWbAbpGZPtto35dt2za
 Yatw==
X-Gm-Message-State: AOJu0Yw3BVutTWta8/z6EyBVweN+51rqneNG+S3AoyjVbJPJuMhlpXbX
 7XI1vK25ZfMQVdzatMcDCV9Bq8b848BRdEmULReA47JZ8iBnNqIX0digmydwRXrXEaullGwaK3C
 UL7FYMA7RYMJeJHAznjDSWXh3QQBXnnVSOaNvAR2JzfyN5TziwQ84IVk7IsfmpsI=
X-Gm-Gg: ASbGncs4iFFVbiSlMe1ybxTVaZE9+GMxa0E9GNlc295pktTUh7u1183EpjnEUuyXq7A
 3hk4CcloNuZVtldbm8xOGIEAT0hooY5lwcNlyniH0LUyUPkXhqxLGYc2Jlt21kJ/WT02h78GTeY
 3W6hi+VAaAIvhgIgrWTtGkH2AxXGNQPvZULO3a9EGmJn8mB/LqoTvdkdTaii56x4r3RuQHHSEGb
 qv19D/rzWGy6YP9PuRKJxcWkHBSe37wzquB1RCV6Ozx1Zxut8aIfTtvX2iOb2bsHn5FTQRis/1g
 DHeE0miuYHqWbQ==
X-Received: by 2002:a05:600c:3493:b0:43d:172:50b1 with SMTP id
 5b1f17b1804b1-452013ec5ebmr124974555e9.29.1749483865485; 
 Mon, 09 Jun 2025 08:44:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKkSc7lFSf+XdAfkz9I9Gcg7rsE2d5Ms93SZM7OJAZWbc14rkGxPKDD+EZMIpkkAEivl1MEw==
X-Received: by 2002:a05:600c:3493:b0:43d:172:50b1 with SMTP id
 5b1f17b1804b1-452013ec5ebmr124974325e9.29.1749483865032; 
 Mon, 09 Jun 2025 08:44:25 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244d66dsm9777277f8f.70.2025.06.09.08.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 08:44:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 0/5] rust: make instance_init implementations use safe Rust
Date: Mon,  9 Jun 2025 17:44:18 +0200
Message-ID: <20250609154423.706056-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bCuNBP0jeyebmVbcV7TFlTQTXPNY51Jy6Zq5PeoNGHk_1749483866
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 09 Jun 2025 15:44:33 -0000

This is a step towards safe bindings to instance_init: making the
implementation safe, though ensuring that *all* fields as initialized
is still up to the implementor.  This helps making it clear what we
want from crates like pinned-init (the Linux one) or its inspiration
pin-init.

This series has two concoctions that are a bit more advanced.

The one in the first patch is probably going to be temporary
once instance_init takes its final form, but it's very useful while
we're stuck with piece-by-piece initialization.

The fourth patch instead is an adaptation of the technique in
GhostCell (https://plv.mpi-sws.org/rustbelt/ghostcell/), which allows
to isolate an object within the invocation of a function.  This one
probably will stay, together with the ParentInit struct that (in one
shape or another) acts as the "proof" that instance_init has been
called on the parent classes.

Paolo

Paolo Bonzini (5):
  rust: qemu_api: introduce MaybeUninit field projection
  rust: hpet: fully initialize object after instance_init
  rust: qom: introduce ParentInit
  rust: qom: make ParentInit lifetime-invariant
  rust: qom: change instance_init to take a ParentInit<>

 rust/hw/char/pl011/src/device.rs |  34 +++---
 rust/hw/timer/hpet/src/device.rs |  56 +++++-----
 rust/qemu-api/meson.build        |   1 +
 rust/qemu-api/src/lib.rs         |   1 +
 rust/qemu-api/src/memory.rs      |  12 +--
 rust/qemu-api/src/qdev.rs        |  51 +++++----
 rust/qemu-api/src/qom.rs         | 175 ++++++++++++++++++++++++++++++-
 rust/qemu-api/src/uninit.rs      |  85 +++++++++++++++
 8 files changed, 341 insertions(+), 74 deletions(-)
 create mode 100644 rust/qemu-api/src/uninit.rs

-- 
2.49.0


