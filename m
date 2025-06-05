Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uN7ZO-0003xn-7M
	for mharc-qemu-rust@gnu.org; Thu, 05 Jun 2025 06:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7ZN-0003xO-EA
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:11:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7ZL-0000TQ-7Z
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749118289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xGJok4ar4KVyPbGQlvZ9sR0i7cZSDEGPhs8lHacKmKo=;
 b=EBANuEIEZGfx0fAnnKORi3K+LM1qkeqXvXHTVIgf8BXun5xjNTjGqgYdKhSbUN13VDSRXh
 D7svEtKNu8VgVHKURxDdo2VfGYDIODx8j+eY081RISNfj9WY6LcuYVuNyYF2/Aap4kl3iV
 MR4BxNAldM4X0NUYFoYv+ieimcVYKvw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-NUUlYX6SMxGUQeOriAj97Q-1; Thu, 05 Jun 2025 06:11:27 -0400
X-MC-Unique: NUUlYX6SMxGUQeOriAj97Q-1
X-Mimecast-MFC-AGG-ID: NUUlYX6SMxGUQeOriAj97Q_1749118287
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-450df53d461so6064195e9.1
 for <qemu-rust@nongnu.org>; Thu, 05 Jun 2025 03:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749118286; x=1749723086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xGJok4ar4KVyPbGQlvZ9sR0i7cZSDEGPhs8lHacKmKo=;
 b=iIQ8H+iiQ/zlwiQxE9n2h+mx13Ag6Mki/oZ4j6kAyF0e6XXpU05nVD2iyg9E55uE54
 Y97etLscrTPN0REJZ262S6CD46YIlkXDWI757f233lTjkb7e5UIUFjesg+sug2XaZ/+y
 LvtbbPSLee1WaKarS7f8Bj9m5ievrllqT39i+T0rmE9KESQcL03L/5df/Gva3oAtInxK
 lsU2IkKd5yiKtnmrGeyNHN5X+0V5JMESIxMLPETcjdtJ7sTfzRG/LS5ZdzJZRCU56Moi
 LwquWCdXOGZ9EdyIxgE4NSmz/dhO33zl+fY9pP7y5aDW5O3O+zRfFVJEVKiy/VLUxTe4
 +FhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/sby3/AX9+MxhhY4DGOT1f6p+GZemHOB49k0tBWtiSxkH4y9X11JqY5Q5XPxWVj85vN9NBDzx7DE=@nongnu.org
X-Gm-Message-State: AOJu0YzoEaxgUmR2Lt7pR3UX/O3SWyk9b15I09JmLkE8aTnsP3No2qeY
 jkqaMlDDwr9G0kMaBTzXdFVph6fwquMWTUSKUSnDl/Im8THiP6FXSWcJnBJanj5KcmRKr6Coiqq
 Bt3eO/42bmlBiyyxqJ+ZLrFHi0F01mDiwzpw5WSHRacm16Aw1o49Y9eQ=
X-Gm-Gg: ASbGnct415rcHDtl4HDU5puYtvNDDO6MtbWpB2mlBI5O1eVCU2zCVAl5IOegHuTXz9T
 Smo7b+mjFYJKiR6cR4u1RDGJZjW0fhJpNJx2lAmaf0mlz22g33gK3YqDPaVl4mtjQPHCZYfIfpx
 lPNSAfQF7d5/Y13ztntYjyqpgC/xzsyXuaSvei1YsX2IYc7zyg1w10//OwNigwglL+V/tHUrcMC
 M5UuCNjfv1GK56m+VH4KPZ4AsLM59/2TA57avQA1FfsqpamRAFwLOzd2bHh5nWVUjpTQawz2lk2
 PB7XEzZ3dtjCug==
X-Received: by 2002:a05:600c:1c29:b0:441:d437:e3b8 with SMTP id
 5b1f17b1804b1-451f0b256e6mr51276485e9.23.1749118286577; 
 Thu, 05 Jun 2025 03:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcYpNOknwHhCDppbGuTnWbslbd758u7i1B1Whn61rsJvLpSAYC0WWvq4h43N730ICCbToKsw==
X-Received: by 2002:a05:600c:1c29:b0:441:d437:e3b8 with SMTP id
 5b1f17b1804b1-451f0b256e6mr51276175e9.23.1749118286143; 
 Thu, 05 Jun 2025 03:11:26 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451f9662cd1sm19986725e9.0.2025.06.05.03.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:11:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, qemu-rust@nongnu.org, armbru@redhat.com,
 mkletzan@redhat.com
Subject: [PATCH preview 0/3] reviving minimal QAPI generation from 2021
Date: Thu,  5 Jun 2025 12:11:21 +0200
Message-ID: <20250605101124.367270-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8p78BANcRwJL7Pv6KTdmSiecxldez1k9tLt6zaQASFc_1749118287
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
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
X-List-Received-Date: Thu, 05 Jun 2025 10:11:33 -0000

This is just an extremely minimal extraction from the patches at
https://patchew.org/QEMU/20210907121943.3498701-1-marcandre.lureau@redhat.com/,
limited to generating structs and enums from the QAPI schema.
It does not include them in any crate and does not compile them.

While I'm not going to work on this, I was curious how much work it
was to produce *some* kind of Rust QAPI struct, which could be a first
step towards using serde as an interface to C visitors, like this:

trait QapiType: FreeForeign {
    unsafe fn visit(v: bindings::Visitor, name: *const c_char, obj: *mut <Self as FreeForeign>::Foreign, errp: *mut *mut bindings::Error);
}

fn to_c<T: QAPIType>(obj: &T) -> *mut <T as FreeForeign>::Foreign {
    let mut ptr = libc::calloc(...);
    let mut ser = QapiSerializer::<T>::new(ptr);
    obj.serialize(&mut ser).unwrap();
    ptr.cast()
}

unsafe fn from_c<T: QAPIType>(obj: *const <T as FreeForeign>::Foreign) -> T {
    let mut de = QapiDeserializer::new(T::visit, obj as *const c_void);
    let value = de::Deserialize::deserialize(&mut de).unwrap();
    de.end().unwrap();
    value
}

/* Generated code below: */

impl QapiType for UefiVariable {
    unsafe fn visit(v: bindings::Visitor, name: *const c_char, obj: *mut bindings::UefiVariable, errp: *mut *mut bindings::Error) {
        unsafe extern "C" visit_type_DumpGuestMemoryFormat(v: bindings::Visitor, name: *const c_char, obj: *mut bindings::UefiVariable, errp: *mut *mut bindings::Error) {
        unsafe { visit_type_DumpGuestMemoryFormat(v, name, obj, errp); }
    }
}

impl FreeForeign for UefiVariable {
    type Foreign = bindings::UefiVariable;

    unsafe fn free_foreign(p: *mut bindings::UefiVariable) {
        unsafe extern "C" qapi_free_UefiVariable(p: *mut bindings::UefiVariable);
        unsafe { qapi_free_UefiVariable(p); }
    }
}

impl CloneToForeign for UefiVariable {
    fn clone_to_foreign(&self) -> OwnedPointer<Self> {
        OwnedPointer::new(qapi::to_c(self))
    }
}

impl FromForeign for UefiVariable {
    unsafe fn cloned_from_foreign(obj: *const bindings::UefiVariable) -> Self {
        qapi::from_c(obj)
    }
}

The FFI types could be generated by qapi-gen, as in Marc-André's
proposal, or from bindgen.

I am not sure what approach is better---whether to use serde or to
automatically generate the marshaling and unmarshaling code; and whether
to use bindgen or generate C-compatible FFI types---but it made sense,
from the point of view of extracting "some" code from Marc-André's
proof of concept and enticing other people, :) to start from high-level
types.

Paolo

Marc-André Lureau (2):
  scripts/qapi: add QAPISchemaIfCond.rsgen()
  scripts/qapi: generate high-level Rust bindings

Paolo Bonzini (1):
  rust: make TryFrom macro more resilient

 meson.build                     |   4 +-
 rust/qemu-api-macros/src/lib.rs |   7 +-
 scripts/qapi/backend.py         |   4 +-
 scripts/qapi/common.py          |  16 ++
 scripts/qapi/main.py            |   4 +-
 scripts/qapi/rs.py              | 183 ++++++++++++++++++
 scripts/qapi/rs_types.py        | 320 ++++++++++++++++++++++++++++++++
 scripts/qapi/schema.py          |   4 +
 8 files changed, 535 insertions(+), 7 deletions(-)
 create mode 100644 scripts/qapi/rs.py
 create mode 100644 scripts/qapi/rs_types.py

-- 
2.49.0


