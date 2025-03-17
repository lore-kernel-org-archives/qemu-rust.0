Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tuE7P-0002ZF-3w
	for mharc-qemu-rust@gnu.org; Mon, 17 Mar 2025 13:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tuE7N-0002XK-E1
 for qemu-rust@nongnu.org; Mon, 17 Mar 2025 13:19:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tuE7F-0000Js-TI
 for qemu-rust@nongnu.org; Mon, 17 Mar 2025 13:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742231943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8NJrv2Q9OBORs8r9pbAIuyVL4ieLBQVOb1zFdbodMI=;
 b=RQ3d8n/Y+U9xJhdMKkggRG1uN8qnbNuiq5PnkwgowbvK7AJZDUrvvOkh9B4ekbjwAdCrjZ
 j0chsmPYgrm0vsMw3nLrDJotWTIxgUhlhmKKBg7JSfe1AD4/NQHsg92+yJKCspyy1RAjIh
 KYFcbSd2Lr4+kzuub0LLl2mMhixcqHE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-qI0dkGjlN_i6PjVsPhdVXw-1; Mon, 17 Mar 2025 13:19:00 -0400
X-MC-Unique: qI0dkGjlN_i6PjVsPhdVXw-1
X-Mimecast-MFC-AGG-ID: qI0dkGjlN_i6PjVsPhdVXw_1742231939
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3912b54611dso3168658f8f.1
 for <qemu-rust@nongnu.org>; Mon, 17 Mar 2025 10:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742231938; x=1742836738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t8NJrv2Q9OBORs8r9pbAIuyVL4ieLBQVOb1zFdbodMI=;
 b=C1QShbrkDtncNVwMTsmmeCAnrZddO6jfIuY2iFsP0B3yWE9ThlQY5tznUDLejcAIxX
 w8oQQuldG3IiOSZ24vDlHryBg70wA4FDCjLbt1FjipNnNrtmDgMiqkkhlZ4GfH/8rvJS
 dNiCge+uZbiF1SmRIgGcniklUIjEhKqA42+N7P3CIy46QWgbT1hsWlIUK1Fn0wV0xGhT
 7SPBbTxpMGIAPRzVBpbIFUBm8rYF+WbNMbnBs/Y5fnqoegY/MtwauAdrSJAvSD+xBCDU
 IRMUjvzSBFgfRgXVapup2sphS6LyTpgc3w0CHY+EyTdyQ8T+QBhrc2I8zmxOGY+nY6aC
 7+dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWchd3kvh+Y6ehIVNP2jcD4OKTPHun/ZzXv17jaWGGKNU31uYXBjIND2TuV4ATg1P3lYTMmUtbs1JM=@nongnu.org
X-Gm-Message-State: AOJu0YwG0nmyMgMe1oWvdWMHPj2K788yaYIaB8B3FgyzOoTGGAkIh/h4
 CijYbQYwQITtNXyrfxqd3D9iHXq32tR3nckVtD4vIfdgtw4nI5gHPQpcnvw1TqpXSA6/LhPhRbc
 ATtNIiSQhpNg+zEXEg8jAIedpf5iybRJ3RKBqa+lvNhva6Ufcme/CY+jc1XYDT2RSHD1wMf0Ee2
 ETjOxhrRoabiSwS7jrH0MAX8PfqA==
X-Gm-Gg: ASbGnctuFLe6Di31X3E5+1NJ5kPfWOIaU4yxXYjENs44iqHkyWqdl2ZKcq9v6Fg46tK
 0w4qZTi02XXJG75SwPqQLdlFC2D51LiDkuCZw/2sMDwNLFUXDeSuTAFDp+laqZFIKtGiEfNPkwA
 ==
X-Received: by 2002:a5d:598c:0:b0:391:476f:d3b7 with SMTP id
 ffacd0b85a97d-3971f510ec0mr13263886f8f.49.1742231938608; 
 Mon, 17 Mar 2025 10:18:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8WIGrTRbXgmT4BGu4xkUEVjrJpV5Rky8OP0QSB/XAKX16wiUEhTXywDoItkWjv2Llu5BroBtww9yTtg7xVGw=
X-Received: by 2002:a5d:598c:0:b0:391:476f:d3b7 with SMTP id
 ffacd0b85a97d-3971f510ec0mr13263863f8f.49.1742231938240; Mon, 17 Mar 2025
 10:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250317151236.536673-1-zhao1.liu@intel.com>
 <20250317151236.536673-14-zhao1.liu@intel.com>
In-Reply-To: <20250317151236.536673-14-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 17 Mar 2025 18:18:46 +0100
X-Gm-Features: AQ5f1JqnGoPEsjNRryfrzw6iWM9h_4dDL3AIFUfQ-PyJ3C5NtVwVwU99JsjbAGo
Message-ID: <CABgObfauvyAbmt7GewurAEw9d+HanhjvDa1tT=S_4Oo9Huty0g@mail.gmail.com>
Subject: Re: [PATCH 13/17] rust/vmstate: Support vmstate_validate
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dlvUkQv4ejEANpxxmocxVSL2DrpaGiNpGPf5xmZrXU0_1742231939
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.335,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 17 Mar 2025 17:19:13 -0000

On Mon, Mar 17, 2025 at 3:52=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
>
> In C version, VMSTATE_VALIDATE accepts the function pointer, which is
> used to check if some conditions of structure could meet, although the
> C version macro doesn't accept any structure as the opaque type.
>
> But it's hard to integrate VMSTATE_VALIDAE into vmstate_struct, a new
> macro has to be introduced to specifically handle the case corresponding
> to VMSTATE_VALIDATE.
>
> One of the difficulties is inferring the type of a callback by its name
> `test_fn`. We can't directly use `test_fn` as a parameter of
> test_cb_builder__() to get its type "F", because in this way, Rust
> compiler will be too conservative on drop check and complain "the
> destructor for this type cannot be evaluated in constant functions".
>
> Fortunately, PhantomData<T> could help in this case, because it is
> considered to never have a destructor, no matter its field type [*].
>
> The `phantom__()` in the `call_func_with_field` macro provides a good
> example of using PhantomData to infer type. So copy this idea and apply
> it to the `vmstate_validate` macro.
>
> [*]: https://doc.rust-lang.org/std/ops/trait.Drop.html#drop-check
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  rust/qemu-api/src/vmstate.rs | 57 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
> index bb41bfd291c0..4eefd54ca120 100644
> --- a/rust/qemu-api/src/vmstate.rs
> +++ b/rust/qemu-api/src/vmstate.rs
> @@ -25,9 +25,12 @@
>  //!   functionality that is missing from `vmstate_of!`.
>
>  use core::{marker::PhantomData, mem, ptr::NonNull};
> +use std::os::raw::{c_int, c_void};
>
>  pub use crate::bindings::{VMStateDescription, VMStateField};
> -use crate::{bindings::VMStateFlags, prelude::*, qom::Owned, zeroable::Ze=
roable};
> +use crate::{
> +    bindings::VMStateFlags, callbacks::FnCall, prelude::*, qom::Owned, z=
eroable::Zeroable,
> +};
>
>  /// This macro is used to call a function with a generic argument bound
>  /// to the type of a field.  The function must take a
> @@ -292,6 +295,14 @@ pub const fn with_varray_multiply(mut self, num: u32=
) -> VMStateField {
>          self.num =3D num as i32;
>          self
>      }
> +
> +    #[must_use]
> +    pub const fn with_exist_check(mut self) -> Self {
> +        assert!(self.flags.0 =3D=3D 0);
> +        self.flags =3D VMStateFlags(VMStateFlags::VMS_MUST_EXIST.0 | VMS=
tateFlags::VMS_ARRAY.0);
> +        self.num =3D 0; // 0 elements: no data, only run test_fn callbac=
k
> +        self
> +    }
>  }
>
>  /// This macro can be used (by just passing it a type) to forward the `V=
MState`
> @@ -510,6 +521,50 @@ macro_rules! vmstate_fields {
>      }}
>  }
>
> +pub extern "C" fn rust_vms_test_field_exists<T, F: for<'a> FnCall<(&'a T=
, u8), bool>>(
> +    opaque: *mut c_void,
> +    version_id: c_int,
> +) -> bool {
> +    let owner: &T =3D unsafe { &*(opaque.cast::<T>()) };
> +    let version: u8 =3D version_id.try_into().unwrap();
> +    // SAFETY: the opaque was passed as a reference to `T`.
> +    F::call((owner, version))
> +}
> +
> +pub type VMSFieldExistCb =3D unsafe extern "C" fn(
> +    opaque: *mut std::os::raw::c_void,
> +    version_id: std::os::raw::c_int,
> +) -> bool;
> +
> +#[doc(alias =3D "VMSTATE_VALIDATE")]
> +#[macro_export]
> +macro_rules! vmstate_validate {
> +    ($struct_name:ty, $test_name:expr, $test_fn:expr $(,)?) =3D> {
> +        $crate::bindings::VMStateField {
> +            name: ::std::ffi::CStr::as_ptr($test_name),
> +            // TODO: Use safe callback.

Why is the TODO still there?

> +            field_exists: {
> +                const fn test_cb_builder__<
> +                    T,
> +                    F: for<'a> $crate::callbacks::FnCall<(&'a T, u8), bo=
ol>,
> +                >(
> +                    _phantom: ::core::marker::PhantomData<F>,
> +                ) -> $crate::vmstate::VMSFieldExistCb {
> +                    let _: () =3D F::ASSERT_IS_SOME;
> +                    $crate::vmstate::rust_vms_test_field_exists::<T, F>
> +                }
> +
> +                const fn phantom__<T>(_: &T) -> ::core::marker::PhantomD=
ata<T> {
> +                    ::core::marker::PhantomData
> +                }
> +                Some(test_cb_builder__::<$struct_name, _>(phantom__(&$te=
st_fn)))
> +            },
> +            ..$crate::zeroable::Zeroable::ZERO
> +        }
> +        .with_exist_check()
> +    };

Would it be possible, or make sense, to move most of the code for
field_exists inside .with_exist_check()?

Paolo


