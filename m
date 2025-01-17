Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYsCW-0001Tf-6S
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 14:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCU-0001Rx-Mb
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCS-0002Ad-0g
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737142809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oL6dTYh2RuaJWRfVXT8oeGcsfRJVUnHMv7b65g9t8lI=;
 b=PIF75Vka2QX9ors4DybzH9LELZRk/HB77hfUdZPhwIKZgEG0JUouL44jKVpRyp98m3y359
 l+YgSLsiLOEjfDENZOLLmnXjGdfRnV+1cZIgkP0zdeyN5k2y4+1gVpOMBVhk+MuOh0aTFW
 s3+fEE/VDXxQLq9iGci6CR1xdAy/m7I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-aUH0pF3xPn-nJa9WPDSQfw-1; Fri, 17 Jan 2025 14:40:07 -0500
X-MC-Unique: aUH0pF3xPn-nJa9WPDSQfw-1
X-Mimecast-MFC-AGG-ID: aUH0pF3xPn-nJa9WPDSQfw
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ab2e529dc35so262021866b.3
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 11:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737142805; x=1737747605;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oL6dTYh2RuaJWRfVXT8oeGcsfRJVUnHMv7b65g9t8lI=;
 b=rmjAsWNbt/b5b7ka+LXtCINm0QFXLUCN0HIZNbNbRtJIYHKg/pb4RHLDarXhTXV1Q/
 jJRgxiar5yjCHdFtjL0qKkWx2GW+U2AWcd/NM+pj5Zt5lYTSlfJpkYl4xMWSdeKuqB1/
 IkKK/R9o8XDPtwd5XOpZVWlbRLBsUQ2lMRnaSqq6uKYHSH2hfuOpiGcasKY1GNKHO+4J
 VkvGpBUcl0QZMpxNLPBNAetCIEwAM/GSJHM+BS6+KSVj+cZBGPh2U+GqWTWzg/OTExpF
 g/2XIw3n28AOOT7qU2UwUovFvNHYU1ZbJ+9i6ZaQwTJVNJhFHO+T57OBsYd/8omVh87c
 A1Wg==
X-Gm-Message-State: AOJu0YwKSzJO8ALt4sgA0YAnCJfFuCjCcO4TpdnDLg6Fpxk7dcT6aJpZ
 IaGalxBGjlbjIRRlk8tbtkXXkXfpZ7PpsVOkuruHwKixBePz1QUHyP/Xo1CLuUb3KXWQQKpL7HY
 mTaGeeU+ieGX2pBFlUWvpgQMuGNN6RGX6ADJaSnes+BtAoFMBvaUkwMFdeHr91g==
X-Gm-Gg: ASbGncs3x62c8Wryb2Xv6ICK2TSe+ykUDFVjFIH9z53Ux0tBzJQz2wCNzJ5NCpOoaD8
 qcIeukAm/Ruo+Q3Ejv26h17S6HGvNYaIVSJVJgxAvTTSR7jx1mwBg0L9FZz9k4QfObUrowLn3DO
 w6W/SHo/QwkrEnr0VQSRjd1PFinqoUDGAO6hX993k5sYdJhiW3BrO+NY9KQhvn5ZyTHbHVBPYt3
 hwCXOt9sLmZJes+05lqgNQCR8r7+Axeme3x/u12jr1Mzw/ND2VsqYLGzXO5Ng==
X-Received: by 2002:a17:906:4783:b0:aa6:3f93:fb99 with SMTP id
 a640c23a62f3a-ab38b3841e5mr384936066b.36.1737142805388; 
 Fri, 17 Jan 2025 11:40:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLBuBP70OXFnADQniFxop/Iejj77O7nKrcI4gYoTNBzUMbfLUHoSgnVW0jFBV892kB6ui8uQ==
X-Received: by 2002:a17:906:4783:b0:aa6:3f93:fb99 with SMTP id
 a640c23a62f3a-ab38b3841e5mr384934066b.36.1737142804891; 
 Fri, 17 Jan 2025 11:40:04 -0800 (PST)
Received: from [192.168.10.47] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384f22457sm215552666b.114.2025.01.17.11.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 11:40:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [RFC PATCH 00/10] rust: remaining part of qdev bindings
Date: Fri, 17 Jan 2025 20:39:53 +0100
Message-ID: <20250117194003.1173231-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: THCI6-Vm57c8XBacbZEHf3ASEkV8Vx6_b9-65yxFV-o_1737142806
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.79,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 17 Jan 2025 19:40:14 -0000

This is what I have left for qdev bindings, including 1) reference
counting and object creation 2) clocks 3) Resettable 4) MemoryRegionOps.
I have no rush for this series, and I expect HPET to be merged before it.
The documentation is not yet complete (will be fixed) and the API is
limited to what is needed for pl011 (which I am not considering a bug,
since the QEMU API is so large), but I think it's already ready for an
initial review.

The most interesting part is perhaps the usage of the builder pattern
for MemoryRegionOps:

    static PL011_OPS: MemoryRegionOps<PL011State> = MemoryRegionOpsBuilder::<PL011State>::new()
        .read(&PL011State::read) 
        .write(&PL011State::write)   
        .native_endian()
        .impl_sizes(4, 4)
        .build();

The code is getting closer to the synopsis at
https://lists.nongnu.org/archive/html/qemu-rust/2024-12/msg00006.html,
except that it works (at least as far as CI is concerned) instead of just
compiling. :)  And since I'm citing it, a reminder that it may still be
worth asking your Rust questions as replies to that message.

You can find the code in the rust-next branch of
https://gitlab.com/bonzini/qemu/, where it passed CI.

Paolo

Paolo Bonzini (9):
  rust: qom: add reference counting functionality
  rust: qom: add object creation functionality
  rust: callbacks: allow passing optional callbacks as ()
  rust: qdev: add clock creation
  rust: qom: allow initializing interface vtables
  rust: qdev: make ObjectImpl a supertrait of DeviceImpl
  rust: qdev: switch from legacy reset to Resettable
  rust: bindings: add Sync markers to types referred to by
    MemoryRegionOps
  rust: bindings for MemoryRegionOps

Zhao Liu (1):
  rust: qemu-api: add sub-subclass to the integration tests

 meson.build                          |   1 +
 rust/hw/char/pl011/src/device.rs     |  88 ++++++++--------
 rust/hw/char/pl011/src/lib.rs        |   1 -
 rust/hw/char/pl011/src/memory_ops.rs |  36 -------
 rust/qemu-api/meson.build            |   1 +
 rust/qemu-api/src/bindings.rs        |  19 +++-
 rust/qemu-api/src/callbacks.rs       |  97 ++++++++++++++++++
 rust/qemu-api/src/irq.rs             |   3 +
 rust/qemu-api/src/lib.rs             |   1 +
 rust/qemu-api/src/memory.rs          | 191 +++++++++++++++++++++++++++++++++++
 rust/qemu-api/src/prelude.rs         |   4 +
 rust/qemu-api/src/qdev.rs            | 188 +++++++++++++++++++++++++++++-----
 rust/qemu-api/src/qom.rs             | 181 ++++++++++++++++++++++++++++++++-
 rust/qemu-api/src/sysbus.rs          |   7 +-
 rust/qemu-api/src/vmstate.rs         |  10 +-
 rust/qemu-api/src/zeroable.rs        |  12 +++
 rust/qemu-api/tests/tests.rs         |  87 ++++++++++++----
 17 files changed, 793 insertions(+), 134 deletions(-)
 delete mode 100644 rust/hw/char/pl011/src/memory_ops.rs
 create mode 100644 rust/qemu-api/src/memory.rs

-- 
2.47.1


