Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tuE0j-0000Dc-3C
	for mharc-qemu-rust@gnu.org; Mon, 17 Mar 2025 13:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tuE0U-000085-1A
 for qemu-rust@nongnu.org; Mon, 17 Mar 2025 13:12:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tuE0K-0007PV-PU
 for qemu-rust@nongnu.org; Mon, 17 Mar 2025 13:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742231511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJ5KwP2rq5reBWn2oKzQI1E5LVg3nqPs62+wCJ/k+Wk=;
 b=i+SGFvaHUgybxsGR/UhqgLqwWVvPhEkryqxzBc5BVTqFH3uqwbHjhu6y6W+yG/KMwCCzO4
 fiXD/Jb/9B5xyLZXtf9aaJx9ij4YP6GHBctr/sudQN6UBVKQn6vrS9fT3zDHUb0bKbcebD
 mPcmqmEUkgY5jK0B6WRKeKCX6FIloJw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-hTM68Ij8OqOAn-yx0YFxhQ-1; Mon, 17 Mar 2025 13:11:49 -0400
X-MC-Unique: hTM68Ij8OqOAn-yx0YFxhQ-1
X-Mimecast-MFC-AGG-ID: hTM68Ij8OqOAn-yx0YFxhQ_1742231508
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3912fe32a30so2146224f8f.1
 for <qemu-rust@nongnu.org>; Mon, 17 Mar 2025 10:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742231507; x=1742836307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bJ5KwP2rq5reBWn2oKzQI1E5LVg3nqPs62+wCJ/k+Wk=;
 b=VdREoBRfKbao3H9zTwVqs9BHQTA3bXg5Yf0wtAB4X58dEa/PZS6rTM1l9ddTtfli2g
 3HBlCHnVqT4XQ776hSobET/uMwE429O7wHVmvK6N7SnHYIWS1csFQ0nqvByzIrPSp6EN
 eYao4vMM+ZQtIY9DKVZ3OzhnO51em1k1RthirNYKroBfxe+SLHhe2k+TKh1RswwJrUu5
 +eJ7Sl9It/WhCRwPvftwVYpe9V33AQs1uGd6pYvBag2leQ+YjyxlDdrPmg9LLkdnSvvJ
 8KatmHXCVrw99gWN/EIOCCs9GBTLxrHD5mA6CrbWBz90fVe9mNF81DjLFUujX8NPZLEB
 xR0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7dgRojCMPdMsRhdjekDi84iRS0kA1k2PT5N36GCXWwQn2ku4V9gy7EHzuwiKo5n0eJuil1PExHtw=@nongnu.org
X-Gm-Message-State: AOJu0YwCneMh+ixIgZ8AzGlSLw+TTqIpCOAIWCvNP2lcLTKVFcvPSOZm
 0ifAywGC0u/FOno3T1F02MPYcrnDDqR5tvu1NCFw/qlU5CAVuhg71YSVrrFYwd4QxwE+A0LQhfX
 6F2nj3thXMrngj2MygKyJirsFPHd6yXSyyGcEx8ryQ6eE8uC5wFh5jeLneaeL08uI5TT6oFwj42
 dWBSSMfD3xBhTT2qXTMTi+WzykD4tv+micdy2n
X-Gm-Gg: ASbGncukridwDNE0twjRuRjWnxB/UnUbrpSoNtZo1bWXW/zriRupxttERDOfnNNJKXC
 k0gzONSUFqqhOEhl40aIS5S90UObJS8dHPJqGAJgFbnkpaRSZsOFBHuaonj70c5nJitSF9ObDAQ
 ==
X-Received: by 2002:a5d:47cf:0:b0:391:2e31:c7e8 with SMTP id
 ffacd0b85a97d-3971d1362e8mr17276888f8f.2.1742231507532; 
 Mon, 17 Mar 2025 10:11:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF18T8n3V0mU46HcWT9TLWYYJxwFSg5FJBWOAYXo2neK/M8dovqjlfB0yasi9oQjAyn/ruvxw0NhrmKYs6mJwU=
X-Received: by 2002:a5d:47cf:0:b0:391:2e31:c7e8 with SMTP id
 ffacd0b85a97d-3971d1362e8mr17276863f8f.2.1742231507145; Mon, 17 Mar 2025
 10:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250317151236.536673-1-zhao1.liu@intel.com>
 <20250317151236.536673-15-zhao1.liu@intel.com>
In-Reply-To: <20250317151236.536673-15-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 17 Mar 2025 18:11:35 +0100
X-Gm-Features: AQ5f1Jq85ZXs2GvZoIC6fNVX4tAVSm9ymSWNtgkmH1yFGsXyEh9uX_hKLBJMehg
Message-ID: <CABgObfaHDrKPx7jRLtOn9CdjC8A1zjpAwBDuuY7WGY9bwYzckw@mail.gmail.com>
Subject: Re: [PATCH 14/17] rust/vmstate: Add unit test for vmstate_of macro
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IUEradvklUFexsla1Diq_xOSXBI_OhO1IMIYN7dWmNQ_1742231508
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.335,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 17 Mar 2025 17:12:14 -0000

Thanks very much for the tests!

On Mon, Mar 17, 2025 at 3:52=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
> -pub use crate::bindings::{VMStateDescription, VMStateField};
> -use crate::{
> -    bindings::VMStateFlags, callbacks::FnCall, prelude::*, qom::Owned, z=
eroable::Zeroable,
> -};
> +pub use crate::bindings::{VMStateDescription, VMStateField, VMStateFlags=
};

Does VMStateFlags have to be part of the public API?

> +    assert_eq!(foo_fields[0].info, unsafe {
> +        ::core::ptr::addr_of!(vmstate_info_int8)
> +    });

You can use & instead of addr_of here.

> +    assert_eq!(foo_fields[0].version_id, 0);
> +    assert_eq!(foo_fields[0].size, 1);
> +    assert_eq!(foo_fields[0].num, 0);
> +    assert_eq!(foo_fields[0].flags, VMStateFlags::VMS_SINGLE);
> +    assert_eq!(foo_fields[0].vmsd.is_null(), true);
> +    assert_eq!(foo_fields[0].field_exists.is_none(), true);
> +
> +    // 2nd VMStateField ("unused") in VMSTATE_FOOA (corresponding to VMS=
TATE_UNUSED)
> +    assert_eq!(
> +        unsafe { CStr::from_ptr(foo_fields[1].name) }.to_bytes_with_nul(=
),
> +        b"unused\0"
> +    );
> +    assert_eq!(foo_fields[1].offset, 0);
> +    assert_eq!(foo_fields[1].num_offset, 0);
> +    assert_eq!(foo_fields[1].info, unsafe {
> +        ::core::ptr::addr_of!(vmstate_info_unused_buffer)
> +    });
> +    assert_eq!(foo_fields[1].version_id, 0);
> +    assert_eq!(foo_fields[1].size, 8);
> +    assert_eq!(foo_fields[1].num, 0);
> +    assert_eq!(foo_fields[1].flags, VMStateFlags::VMS_BUFFER);
> +    assert_eq!(foo_fields[1].vmsd.is_null(), true);
> +    assert_eq!(foo_fields[1].field_exists.is_none(), true);
> +
> +    // 3rd VMStateField ("arr") in VMSTATE_FOOA (corresponding to
> +    // VMSTATE_VARRAY_UINT16_UNSAFE)
> +    assert_eq!(
> +        unsafe { CStr::from_ptr(foo_fields[2].name) }.to_bytes_with_nul(=
),
> +        b"arr\0"
> +    );
> +    assert_eq!(foo_fields[2].offset, 0);
> +    assert_eq!(foo_fields[2].num_offset, 4);
> +    assert_eq!(foo_fields[2].info, unsafe {
> +        ::core::ptr::addr_of!(vmstate_info_uint8)
> +    });
> +    assert_eq!(foo_fields[2].version_id, 0);
> +    assert_eq!(foo_fields[2].size, 1);
> +    assert_eq!(foo_fields[2].num, 0);
> +    assert_eq!(foo_fields[2].flags, VMStateFlags::VMS_VARRAY_UINT16);
> +    assert_eq!(foo_fields[2].vmsd.is_null(), true);
> +    assert_eq!(foo_fields[2].field_exists.is_none(), true);
> +
> +    // 4th VMStateField ("arr_mul") in VMSTATE_FOOA (corresponding to
> +    // VMSTATE_VARRAY_MULTIPLY)
> +    assert_eq!(
> +        unsafe { CStr::from_ptr(foo_fields[3].name) }.to_bytes_with_nul(=
),
> +        b"arr_mul\0"
> +    );
> +    assert_eq!(foo_fields[3].offset, 6);
> +    assert_eq!(foo_fields[3].num_offset, 12);
> +    assert_eq!(foo_fields[3].info, unsafe {
> +        ::core::ptr::addr_of!(vmstate_info_int8)
> +    });
> +    assert_eq!(foo_fields[3].version_id, 0);
> +    assert_eq!(foo_fields[3].size, 1);
> +    assert_eq!(foo_fields[3].num, 16);
> +    assert_eq!(
> +        foo_fields[3].flags.0,
> +        VMStateFlags::VMS_VARRAY_UINT32.0 | VMStateFlags::VMS_MULTIPLY_E=
LEMENTS.0
> +    );
> +    assert_eq!(foo_fields[3].vmsd.is_null(), true);
> +    assert_eq!(foo_fields[3].field_exists.is_none(), true);
> +
> +    // The last VMStateField in VMSTATE_FOOA.
> +    assert_eq!(foo_fields[4].flags, VMStateFlags::VMS_END);
> +}
> --
> 2.34.1
>


