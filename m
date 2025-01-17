Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYidA-0002Vm-E3
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYid9-0002VF-5Z
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:27:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYid6-0003O4-0U
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737106023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=b486P7QDYUT1skG7NsQHZqf9CNEnvk1cpaVCEyko9DU=;
 b=esz5rEu2/ecA8DY8X65y/N+5fXYQwkQFhMfU0iFTVZlQVWQBb768CHMvCJsuuqEKr7jcts
 kM09lSai5ofWvA0BeN6NyBjRMmfA1N40pU+R2p70peND2acccObAej4bjc7SUOyfSrsRMC
 CFOERe1zMo8TdQwcR2PsNUPfiEJkTNA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-P6iijwfpPNO-ym_mv_H-7g-1; Fri, 17 Jan 2025 04:27:01 -0500
X-MC-Unique: P6iijwfpPNO-ym_mv_H-7g-1
X-Mimecast-MFC-AGG-ID: P6iijwfpPNO-ym_mv_H-7g
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-aa6704ffcaeso216823866b.2
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:27:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737106019; x=1737710819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b486P7QDYUT1skG7NsQHZqf9CNEnvk1cpaVCEyko9DU=;
 b=Bm7+9tTtaSGe/ec8NqfiTwM7Tje2RjiWiHCJMu7ZKOb/Ivh1jORHDz+T4JYfXUMwQZ
 6Mk8cDErn+40sZPkwoSwl76o3HGnYi3UrGVXfBcu9iWoS5/g7nau+/xBVwhfx51PdFdv
 PQmFDjuCGB5bzyxwEQocqV9NmD/lz8AlYjuUDgPWFfuKWM+9cWoJ/wOdBMEv2U4R70Pe
 57URTAMRFg8swSm7qMXIbY3zbNnft45NxKTzOtMOJUcEN/nQXZzt7AV1UkxvLGqmgzND
 f9ipD/akxFUZII1rivK54E/oulzpj82gGCLg1uhp+QtI8+80XZE7JkFXPrt1qgmRh5RA
 Dg/Q==
X-Gm-Message-State: AOJu0YyeQeD3UupMTPSRxzV9klKL0VX/s+nUWHqx/wF0vvTYYKP1Tyoh
 96FGj7iCrFFNYFSXJH+ks2e8+2CTYWPQ2YYPRH2SWNUJF8AOaHEasp97n6zsCTEdLDJBpITeDlR
 bm6Z6URXBtU/BeHrvlxKMeILMwkAgJOnHe2kmNdK8ROvsFa210wVFOAzbJDkWkA==
X-Gm-Gg: ASbGncu6voFrlh7y4A3E3h7HxhpCTYD/FrYh2orD7Pe9AUbA/I0QLIIqpgQZlDzH2ul
 000bhLJ1wjCLon5SKEp/9tUqgNHiIqInHnL+PN/rRZO5FcZMMcgQBKSnCfUHaYRSiI3goliamQY
 AGmnZFiuEiz1sgTvmTxpS1BKCWkjBFK9ayzhuFIF70/RqAiajUfYLXe8I2zQ57XEbh/r2NY8IWr
 dgWX+XaWUhrAoEtG8LfQVN0ncYanpXuQ1fBRWW0Xx0D7VlHw3vNd/3+a01l
X-Received: by 2002:a17:907:9803:b0:ab3:47ce:7931 with SMTP id
 a640c23a62f3a-ab38b42ad35mr158066066b.44.1737106019471; 
 Fri, 17 Jan 2025 01:26:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEymVy78kMxXiofVYv+pkVdNjWFf53m+NmdS3yabEnhJIOFVdAosEYy9sJMWX42n/UbGs7NOg==
X-Received: by 2002:a17:907:9803:b0:ab3:47ce:7931 with SMTP id
 a640c23a62f3a-ab38b42ad35mr158065066b.44.1737106019032; 
 Fri, 17 Jan 2025 01:26:59 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384ce109asm141088566b.51.2025.01.17.01.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:26:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 00/10] rust: pl011: correctly use interior mutability
Date: Fri, 17 Jan 2025 10:26:47 +0100
Message-ID: <20250117092657.1051233-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xjWcfcccVBVLsB6BaDkfsh8llysU6juKHG72JfaMJbk_1737106020
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.797,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 17 Jan 2025 09:27:07 -0000

QOM devices are aliased from the moment that they are added to the
QOM tree, and therefore must not use &mut.  This has been a known
issue since the beginning of the Rust in QEMU project, and since
then a solution was developed in the form of BqlCell and BqlRefCell.

This series moves the MMIO code and registers from PL011State to
a new struct PL011Registers, which is wrapped with BqlRefCell.
This also allows to remove device-specific code from the device's
MemoryRegionOps callbacks, paving the way for MemoryRegionOps
bindings.

I am making this series a prerequisite to the usage of Resettable,
because it allows reset to reset take a shared reference to the
device.  Thus the Resettable implementation will not have to
temporarily take a mut reference.

Paolo


Paolo Bonzini (10):
  rust: pl011: remove unnecessary "extern crate"
  rust: pl011: hide unnecessarily "pub" items from outside pl011::device
  rust: pl011: extract conversion to RegisterOffset
  rust: pl011: extract CharBackend receive logic into a separate function
  rust: pl011: pull interrupt updates out of read/write ops
  rust: pl011: extract PL011Registers
  rust: pl011: wrap registers with BqlRefCell
  rust: pl011: remove duplicate definitions
  rust: pl011: pull device-specific code out of MemoryRegionOps callbacks
  rust: qdev: make reset take a shared reference

 rust/hw/char/pl011/src/device.rs       | 458 ++++++++++++++-----------
 rust/hw/char/pl011/src/device_class.rs |  52 +--
 rust/hw/char/pl011/src/lib.rs          |  61 ++--
 rust/hw/char/pl011/src/memory_ops.rs   |  23 +-
 rust/qemu-api/src/qdev.rs              |   2 +-
 5 files changed, 314 insertions(+), 282 deletions(-)

-- 
2.47.1


