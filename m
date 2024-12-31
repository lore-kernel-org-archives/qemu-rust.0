Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tSQ3A-0003NM-CJ
	for mharc-qemu-rust@gnu.org; Mon, 30 Dec 2024 19:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ35-0003MY-Ov
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:23:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ33-0001xW-1A
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:23:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735604625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=20JLlnKhVGNyGf1xgIyZoN4lgjdqIel1uxoMLonmRjI=;
 b=QbZsfOQX2D4XyngnS+T9fEkAU1tA9T/dmYpOsk8pU1vZqS+YtXJfWS8iD8Ypvav96cnGx5
 1cZbgFZFSolyOFHYrjWcLe/7HjzUIN3hBvmhL9JcrGPbznM9IQ3hdK3sFERIYQAu/s/eoU
 6iiBEgOYzlYpT0cUiwFkJsAfzW1ZHE4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-HcPjWcq_Pt-Unmx6WRn3ng-1; Mon, 30 Dec 2024 19:23:40 -0500
X-MC-Unique: HcPjWcq_Pt-Unmx6WRn3ng-1
X-Mimecast-MFC-AGG-ID: HcPjWcq_Pt-Unmx6WRn3ng
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361ecebc5bso9977265e9.1
 for <qemu-rust@nongnu.org>; Mon, 30 Dec 2024 16:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735604619; x=1736209419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=20JLlnKhVGNyGf1xgIyZoN4lgjdqIel1uxoMLonmRjI=;
 b=W8VazmO9Wf8mpYB14ktahkcPi5NZxgOgDz4Uut83Z2UBqVghtnfwEhUVJfDOXVWnr0
 tBuFV2aeB79luyC1uBbpya2m29R6sxzJRKKvCvFlbsItCBFcVVl/c8U8LuyDNrMdMPjK
 bFuLRvtYNiEOhKLccOiOWBhbO9DCNSsvS78gXO5H45PPXn4P2ky7PSeuhl3OQmnL/hqo
 /pSoq9e/DytKJdwaAxl2YtkvkHaPxwJYBCb79sz6U9JcJYa1a26nl5HPMhl8rkY+Kd/0
 zKGA6yLgw0oz86EbX4TfjCYFtDG27/DPu5dbLIOwuLuIzQmptcoHGT0R1UhkwBiIboiQ
 sbYQ==
X-Gm-Message-State: AOJu0Yw54YytkIblkaVxpKeAfQTNxtCbsE2etwjU76SIr8915NH/2LOq
 dEHGtQPKs8ux/AesRfZAg+q6yAbkkU1maskSqk8fWZop3yKHhH/rr438JdmmPpR7TwpgXxy2f0A
 WZYVXhEj7R1jW0dMj40aFX06HQccFlbbK2EjINa2ILmXZvfnnTFc=
X-Gm-Gg: ASbGnctS25uu16cZLxkHYsxsAXAKwSDw64L/wTmkMgGh2NDVvDXhWx9SbISFLuZgcZk
 n9gMb2zJIkL/o11pWIb1LpumgpdxnXd295vcMtAruV8hsKhFizCjZjfi9llGEK8rtRhkAt1Ene7
 qQUjKSWwIjbkqK9BxPuPHKL3W18Cbyuaih0kRHpWsi9RJaXPcZuKksojC799ZhHaOz9Ye1UJEXl
 plIe1WACem14s6gXmlZHmExLP6sEJqCEGaVdj3DVKa90iYAd+bcGlKrIO0=
X-Received: by 2002:a05:600c:3505:b0:434:fafe:edb with SMTP id
 5b1f17b1804b1-43668b5f326mr286831115e9.24.1735604619208; 
 Mon, 30 Dec 2024 16:23:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJDir+9oM2746BzqIGIR55h8Jcc3q+74tzCVMJaCQfmht6jkQUz9kA/lc2WpcBx7beQkEw8Q==
X-Received: by 2002:a05:600c:3505:b0:434:fafe:edb with SMTP id
 5b1f17b1804b1-43668b5f326mr286831065e9.24.1735604618797; 
 Mon, 30 Dec 2024 16:23:38 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b11aecsm403171205e9.23.2024.12.30.16.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 16:23:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com,
	junjie.mao@hotmail.com
Subject: [RFC PATCH 0/9] rust: (mostly) type safe VMState
Date: Tue, 31 Dec 2024 01:23:27 +0100
Message-ID: <20241231002336.25931-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4_Xx-ER_I2CgUVv2b_s2qbeFEmKbyo6390YwyudjVrU_1735604619
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.187,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 31 Dec 2024 00:23:53 -0000

The existing translation of the C macros for vmstate does not make
any attempt to type-check vmstate declarations against the struct, so
introduce a new system that computes VMStateField based on the actual
struct declaration.

Macros do not have full access to the type system, therefore a full
implementation of this scheme requires a helper trait to analyze the type
and produce a VMStateField from it; the trait stores the VMStateField
as ana associated const.  Then, a macro "vmstate_of!" accepts arguments
similar to "offset_of!" and tricks the compiler into looking up the
trait for the right type.

Structs and cells have their own sub-VMStateDescription.  This poses
a problem in that references can only be included in associated consts
starting with Rust 1.83.0, when the const_refs_static was stabilized.
So for now structs and cells cannot be done in a type-safe manner,
but arrays, pointers and scalars can.

Technically, scalar types have the same issue in that they point to a
VMStateInfo.  For this case however there is onlyya limited list of
VMStateInfos, so I am placing them in an enum, and going from enum
to &VMStateInfo only when building the VMStateField (i.e. in a static's
value rather than in an associated const, and in a macro rather than in
a const fn).  This isn't great, but it's easily removed when QEMU starts
accepting a newer Rust version.

The series also introduces the pattern of applying changes to a struct
using methods with a fn(mut self) -> Self signature, for example

    pub const fn with_version_id(mut self, version_id: i32) -> Self {
        self.version_id = version_id;
        self
    }

This is not quite the builder pattern because there is no need for a
final ".build()" call, but it's similar/related.

The unfavorable diffstat comes half from the const_refs_static workaround,
half from new documentation (so in that case it's a plus rather than
a minus).  And also, there is more functionality and extensibility in
the new mechanism, whereas only a subset of the C macros was included
in the previous implementation.  The exception is "field_exists", which
may be added later if needed as a modifier, similar to with_version_id().

Paolo


Paolo Bonzini (9):
  rust: vmstate: add new type safe implementation
  rust: vmstate: implement VMState for non-leaf types
  rust: vmstate: add varray support to vmstate_of!
  rust: vmstate: implement Zeroable for VMStateField
  rust: vmstate: implement VMState for scalar types
  rust: vmstate: add public utility macros to implement VMState
  rust: qemu_api: add vmstate_struct and vmstate_cell
  rust: pl011: switch vmstate to new-style macros
  rust: vmstate: remove translation of C vmstate macros

 rust/hw/char/pl011/src/device.rs       |   3 +-
 rust/hw/char/pl011/src/device_class.rs |  36 +-
 rust/hw/char/pl011/src/lib.rs          |   6 +
 rust/qemu-api/src/prelude.rs           |   2 +
 rust/qemu-api/src/vmstate.rs           | 673 ++++++++++++++++---------
 rust/qemu-api/src/zeroable.rs          |  31 ++
 6 files changed, 481 insertions(+), 270 deletions(-)

-- 
2.47.1


