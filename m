Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9289CEACEF
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 08:48:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKuu4-00041n-DN; Mon, 17 Nov 2025 03:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKuu2-000402-8o
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 03:48:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKuu0-00070Z-2M
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 03:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763369278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zj1nInfR3UeZsM3aae0qLP9sPE2mkuL4wOLQLqCpPY4=;
 b=dcXWNI4zQgHZ0i1Nbnk9R7k2eoSaA17Jwqfre0MMNRjY5x51URre4lBv4FTvdw7pRCWk/K
 9mFWaDDN0QOCB0UvtU7RYpxPMHA5QHt9TtOTLYlERXltxKXsgYsNOn4fLsdPdJoz2uUFHF
 YyyxLpZqevdgAMDvOhcYlaQiues2JHk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-89h0cfOFMd6C2CQ5MMNdaA-1; Mon, 17 Nov 2025 03:47:56 -0500
X-MC-Unique: 89h0cfOFMd6C2CQ5MMNdaA-1
X-Mimecast-MFC-AGG-ID: 89h0cfOFMd6C2CQ5MMNdaA_1763369275
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-429cceeeb96so1727197f8f.1
 for <qemu-rust@nongnu.org>; Mon, 17 Nov 2025 00:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763369275; x=1763974075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zj1nInfR3UeZsM3aae0qLP9sPE2mkuL4wOLQLqCpPY4=;
 b=g12cPafngCvH35uVDu6BBzl/h6gZzC0JQtis7X8GGHTT0PC5aA/MXlSqKh3hunWSVu
 KKvmQ2iXTI52LYTOOY0Y6iX81N8GIq4ObWU8Z7lvKgFcDLTuLDAys0hCq4v7jl65OXro
 9uolE8iL0dVHH/XEl0Sj9EuuoB97Ish7LSU8Q/mEDUuih3+isqu+t6A6u/5J+mvhGsTe
 aazK2gu1CLlChbxHJ3fs6vLrMIx+wwJVbYr7LqYSTYiNr6eIlT2+tD3Uliwk9IWEWnSI
 u1nJJYNtTu63XHmRGgiN7q5eRV6u5IrNgzNX+UqP1EQ2emPj88268Of3tf242lHV3oPE
 LuAg==
X-Gm-Message-State: AOJu0YzsEQh8fJgao/oBk97XqVhlg+G4TPgYDhGNnMiN5d4EyMl3sjf6
 +8fBfJXCV4Dyyn5LCOqKWd6W18jph3At+QU5m6KOIpfibMTzPpgi4X/fGk9hH4jkQDqryoZl53w
 66LawmXD3k10rLzF6tSMYx0MnI73D4DbfKtVoM82SsW51MFFLW293TJo=
X-Gm-Gg: ASbGnctZ4NHrbgdR6uVYx34CfSHzC9OSSb8WwSNmxH8Dlj2TtBeC2W78Hx2RrT/6SSH
 1R8GfGgR5EOngOnjKKQQBqEEpxLUddziOtKvPcAfTp3/4yjlvxf7JiQW5Lhbgfm88712uNpsYMf
 VVOpAAi9nwNNO+JH2w0tX8eUvWb2BEcGQ5w3DIEu3OTOOAk5T3Bp3bst1EupG0GJT3ND3T+WnUO
 RS8D/Jbn58ShD48JDzzKzrkcMuGf2/hJ6TEO25loOGDqVqElHBpxT+4fL4lzVdXO2meW5mndpqh
 E/pVSHcy0zy6Q961BVrBYeYF7hsYUsWZPTZ1qLYmqA8KYtXNTqsWyhwfjSlhtFTH+qaJ/YxcOz0
 8puSwo4F05yY9R6IyhNz0GEVglELPnZ3jB7k8PayPmiuza/fALgb/uXawTlVu/hNpKIfJYJU8zr
 TxxAaH
X-Received: by 2002:a05:6000:2083:b0:42b:3867:b39c with SMTP id
 ffacd0b85a97d-42b593745c4mr10653762f8f.34.1763369275259; 
 Mon, 17 Nov 2025 00:47:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLS2FixPcIcpTS6ZXVj6ShIviFsRbRGTqL7Hk7+jFgEEjYIgwEIycjfWFHHRNMi+JWxaTBiA==
X-Received: by 2002:a05:6000:2083:b0:42b:3867:b39c with SMTP id
 ffacd0b85a97d-42b593745c4mr10653744f8f.34.1763369274798; 
 Mon, 17 Nov 2025 00:47:54 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e845bdsm24187986f8f.12.2025.11.17.00.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 00:47:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 0/5] rust/hpet: complete moving state out of HPETTimer
Date: Mon, 17 Nov 2025 09:47:47 +0100
Message-ID: <20251117084752.203219-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q-fVowgxYsaTKhg8vpHxZDjwkgbsKcfocpEzCwhNPKA_1763369275
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

This state continues the cleanups of the HPET state, moving fields out of
BqlCells and into HPETRegisters and HPETTimerRegisters.  It also restores
the old migration format and shows an interesting trick: HPETTimer is now
a very simple object that handles the "unsafe" backreference from the
timer to the HPETState, but it also implements ToMigrationStateShared
and is stored in the HPETState as Migratable<[HPETTimer; N]>.  I find
it pretty cool that the composition works naturally.

The less beautiful part is that I had to modify Timer::init_full for
this to compile.  It's probably time to work on the final design for
initialization, because this is becoming very ad hoc and the differences
between timer, MemoryRegion and Clock initialization have no real
justification.

I'm leaving out the conversion to Mutex because, as Zhao noticed, it
has a deadlock - the timer callback tries to grab the HPET mutex inside
the BQL, where as the vCPU tries to grab the BQL inside the HPET mutex.
This is not present in the C code only because... it doesn't take the
lock at all in places where it should.  In particular hpet_timer() reads
and writes t->cmp and t->cmp64 outside the lock, while hpet_ram_write()
does so within the lock via hpet_set_timer().

Patch 4 ("rust: migration: implement ToMigrationState for Timer") is
still incomplete, and provided here as a starting point.

Please review!

Paolo

Paolo Bonzini (4):
  rust/hpet: move hidden registers to HPETTimerRegisters
  rust/hpet: move hpet_offset to HPETRegisters
  rust/hpet: remove BqlRefCell around HPETTimer
  rust: migration: implement ToMigrationState for Timer

Zhao Liu (1):
  rust/hpet: Apply Migratable<> wrapper and ToMigrationState

 rust/hw/timer/hpet/src/device.rs | 377 ++++++++++++++++++-------------
 rust/migration/src/migratable.rs |  31 +++
 rust/util/src/timer.rs           |  22 +-
 3 files changed, 264 insertions(+), 166 deletions(-)

-- 
2.51.1


