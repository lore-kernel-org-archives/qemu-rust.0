Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYiDs-0001pU-TS
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiDq-0001oz-Gh
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:00:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiDo-00082P-Ry
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737104456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lochbdNwgn2xiZvOYaiCH7K0XCGeWnITWJQQX3Wahbs=;
 b=gXMLJGGK7EhYBnQKbeGfFp6AKG50UV0ejeGWScEJR9aE4Q8PgZBV0l25mp5o5INgRR4EUU
 IidFraXcDPF73Ph7n9eIDAJk0txsx0uVwrEUa/JIinF6oCtxkG6g6TZnueS17U2ZaPH+My
 2K/4zZzZJSRMV16NFIKd4bGHJXFD1Xg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-5b831N0cMgGTS-8U1E_erQ-1; Fri, 17 Jan 2025 04:00:51 -0500
X-MC-Unique: 5b831N0cMgGTS-8U1E_erQ-1
X-Mimecast-MFC-AGG-ID: 5b831N0cMgGTS-8U1E_erQ
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-aa6b904a886so155763666b.0
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:00:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104450; x=1737709250;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lochbdNwgn2xiZvOYaiCH7K0XCGeWnITWJQQX3Wahbs=;
 b=pG38mFZy/kJ5W9gKfYSfwUpaTXmf0l7RRWRXoq9or8aT7EzXaZj4bIzKyzMFrmIl+H
 htEMX4xCVqXLv0ZB9htgNZbZewwC2KyLPZxooOy0JcOuCmxmIBxfpD86C4LyPJcdaSrA
 bb6xKD0UImCbtynsgexdYrbwQ5My77fS7RQ2P8h8ovIyspj4nauYQb+kwJmoic55cmTL
 /AtJfEZSKplqGkRKWRv1Mt7Qoee3xa3/J2RlYoZvmhLHqlODcGncm0gGfB5pYTLvlmOJ
 AJ8zC7U9stfK+fD8KCm+PfHQohjIVx2b5B/9+5PWwy2jZ6EQNCacDUShSyGLbRpNPD25
 tXpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXXCq5BMWhZijIqoGtc4eKwDOZyG6ejBFeGUtHYHm35cnbV4SN+zM25KxxkVV1akxQ9od15z+N0vE=@nongnu.org
X-Gm-Message-State: AOJu0YyLe6zCMKD0dgXY745Ne/s6j49DQNPiaR59Z7C+qTw/Hjq6tgIg
 72X2eobMbesFwuS3Wgo7ZqoAKohyTxV/zVqwz3mlpnYLbW2sLqXlMGIREAqZ+qYLIZFrcfmeyI8
 LHgLjCxQnT5KO+MYJJ4ldH5yzISj56HnbjhuW17jVUil+Kq7Z9ab0bfI6gmAplw==
X-Gm-Gg: ASbGnctZs+tg9JzB47HWGBBNb6fe/rNUdso5/RedLLvYO8RNKkqLWcsZvFNYJadxuXi
 QebPGfcz7pWjqjbxjF7fFdUjC/8xN9GMAZ8R/x5RzHnwiP2CIdZNXoPogyH2c+wK1xqshRWdiTZ
 Aod00gIcjL5fnZ+eOp4udRrN1Fa8RHeeF8akK38FoONiz/uTifU2FMi/OxlrLkmmneImnkdKcpd
 uEgAseFpquYLRkYaq1po7fWJqAn7uJKW6rBG6shthqaR/DkXctv7MD2G8x9
X-Received: by 2002:a17:907:d9f:b0:aa6:7ec4:8bac with SMTP id
 a640c23a62f3a-ab38b1100c3mr185350266b.17.1737104450055; 
 Fri, 17 Jan 2025 01:00:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVqysmZdh7m+Yxpv5bZN7QirBE8CFDC3dWjk3FJjb/61G4m9IY/jAcuPz+/uZzGNNqNRK7zg==
X-Received: by 2002:a17:907:d9f:b0:aa6:7ec4:8bac with SMTP id
 a640c23a62f3a-ab38b1100c3mr185345866b.17.1737104449556; 
 Fri, 17 Jan 2025 01:00:49 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384fcb262sm133248166b.169.2025.01.17.01.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:00:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 00/10] rust: (mostly) type safe VMState
Date: Fri, 17 Jan 2025 10:00:36 +0100
Message-ID: <20250117090046.1045010-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iQJ_hXEGHgQLMOPZd0PoPkAOLz1zD8csU7KjTWUQZS8_1737104450
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 17 Jan 2025 09:00:58 -0000

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

v1->v2:
- add attribution for call_func_with_field macro
- add VMS_VARRAY_FLAGS, check it in with_array_flag
- remove Option<NonNull<T>> support, add Box<T>
- fix cut and paste typo in vmstate_varray_flag
- fix rustfmt
- move SCALAR_TYPE definitions to the right patch
- keep $num as an ident rather than tt
- remove vmstate_cell
- make order of parameters consistent in vmstate_clock (last patch, new)

Paolo Bonzini (10):
  rust: vmstate: add new type safe implementation
  rust: vmstate: implement VMState for non-leaf types
  rust: vmstate: add varray support to vmstate_of!
  rust: vmstate: implement Zeroable for VMStateField
  rust: vmstate: implement VMState for scalar types
  rust: vmstate: add public utility macros to implement VMState
  rust: qemu_api: add vmstate_struct
  rust: pl011: switch vmstate to new-style macros
  rust: vmstate: remove translation of C vmstate macros
  rust: vmstate: make order of parameters consistent in vmstate_clock

 rust/hw/char/pl011/src/device.rs       |   3 +-
 rust/hw/char/pl011/src/device_class.rs |  38 +-
 rust/hw/char/pl011/src/lib.rs          |   6 +
 rust/qemu-api/src/prelude.rs           |   2 +
 rust/qemu-api/src/vmstate.rs           | 700 ++++++++++++++++---------
 rust/qemu-api/src/zeroable.rs          |  31 ++
 6 files changed, 504 insertions(+), 276 deletions(-)

-- 
2.47.1


