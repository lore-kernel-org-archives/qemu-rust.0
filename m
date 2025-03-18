Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tuTul-0003lX-CE
	for mharc-qemu-rust@gnu.org; Tue, 18 Mar 2025 06:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tuTuj-0003l1-KE
 for qemu-rust@nongnu.org; Tue, 18 Mar 2025 06:11:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tuTuh-0006b3-Ne
 for qemu-rust@nongnu.org; Tue, 18 Mar 2025 06:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742292667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/nDQZGo1WQMqsPQxU3R1T7Imxx0FEII62+ElBw7z1as=;
 b=fzzYDK6Id514WJ3WGGjWu77HXIv4xx/O6sg4rrfOOoPyA1EobcbYCJEk33iCUA/dPRSFAj
 ew9LL7mw0ssw/nttFZQxrrWuMd5tY/rnf/gHKUX+OFZ0YJliQF4aKcce4mj5mjF79F3RbJ
 EUPSOtoHKbZL6x9dK4VydRHHCXoIoR8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-2YZDIabsOOuiMSqdN_iTZg-1; Tue, 18 Mar 2025 06:11:06 -0400
X-MC-Unique: 2YZDIabsOOuiMSqdN_iTZg-1
X-Mimecast-MFC-AGG-ID: 2YZDIabsOOuiMSqdN_iTZg_1742292666
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43bc97e6360so16470775e9.3
 for <qemu-rust@nongnu.org>; Tue, 18 Mar 2025 03:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742292665; x=1742897465;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/nDQZGo1WQMqsPQxU3R1T7Imxx0FEII62+ElBw7z1as=;
 b=LEpZAddrCuvvz5Vf20kiH0zQFZIChCvNvPbDTG7paQTG95VhVpn4SeMNjGYT0glRWe
 I2wgvwVJ0BVSonPBa3BHlZWUEMX2RuW7+uR1eFjz3gXeXOJKhjg9bJ9Npu7YCRGb7YLT
 Rmu1fmHl1sS1g6Im+8ugXEHY0MNeWFv8ozU4vxZY+nKOu+jQx8UhPq+T09MSRpgXw7Rp
 SjRiiKvr0bD15RuVYr3RXgjDhXFmB0fRPg4VFzkuEWv1ujZn04f72XxMxQgqRq+dgMsU
 +YbC8UPBRK2dLuxI7g+vjJ9HTYV7Paxmx1a5q0zEmJfrPmmfaaSHFkj9yPryscKhR131
 pKlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5VdoEVFOJIuDafKORa1Rwi9bufrpe50LFKgvJldQWO0a1Enz1BP1z4LEZS8o1LD5+SFZ4k1NbPu0=@nongnu.org
X-Gm-Message-State: AOJu0YyfZByMZlHlJvZe+PyUjoor8QRAaPst+sMiFSqTGAos+TkCnWPW
 orH+bhdLZWKcDIGL90f62jXVECUCaHL06+WJpwqaxuN1uUFcLfewWZwX/LyywqP+JgPqZvezZ42
 VfPQbJUEyjixtLUyGWW5PslkZcQYgQxqHVMcSuv8GE0XPq5vbWboFfs7aBcw=
X-Gm-Gg: ASbGnctI2UgZvjApK+bR/Hw4wWjpXHlehv8d2N5QG4DsL8XfDnZ/qrlReSlujg7GK0k
 giSFc0LTFW08UmKh4OCzh2GZWB+NX/FZjhb/OX0JqC9w2leiIBMbxqMSfRUK9yuNalpKPvb4Hsm
 jRumk6q/0hcjYcJLiKeXWouVxG2ApMrwrtC4RPwpm0oSWrMvm1jdGz5rQ01hb7A1rK2Ukkz+7k6
 ZeLGzn5Mc6MAU8L2g37pf4Tze7MEsjNTd4nlxIzDYrAVUvNIQxBtOWVFWHEYMr4TVqUgnZdjhxq
 vWCP0ga7KYCbWKPIDhqJ
X-Received: by 2002:a05:600c:3d0e:b0:43c:fded:9654 with SMTP id
 5b1f17b1804b1-43d3b9c1106mr12751725e9.19.1742292665173; 
 Tue, 18 Mar 2025 03:11:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQd7CPauUoeI1J+3pjDnrPVWH4Qa9az+4jT6lV9G9cbQ+/EZWH7Qn0dI3toBHe0WRag9re3A==
X-Received: by 2002:a05:600c:3d0e:b0:43c:fded:9654 with SMTP id
 5b1f17b1804b1-43d3b9c1106mr12751445e9.19.1742292664695; 
 Tue, 18 Mar 2025 03:11:04 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.194.153])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43d3bb35d98sm9464885e9.0.2025.03.18.03.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 03:11:03 -0700 (PDT)
Message-ID: <9e8743b8-99b2-4aab-84de-7630edcc7e10@redhat.com>
Date: Tue, 18 Mar 2025 11:11:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] rust/vmstate: Support vmstate_validate
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250318083248.1402990-1-zhao1.liu@intel.com>
 <20250318083248.1402990-11-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250318083248.1402990-11-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jX5UyAvlzUBztt-mJtCOO5uQu8UBViF6Pe7wsLH_6xs_1742292666
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.335,
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
X-List-Received-Date: Tue, 18 Mar 2025 10:11:13 -0000

On 3/18/25 09:32, Zhao Liu wrote:
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
> Additionally, add a `with_exist_check()` method to help add callback
> in future.

I think for now, until it can be const, we can remove it and clean up
things a bit:

diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 62a0308014e..2786e8ae709 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -294,30 +294,6 @@ pub const fn with_varray_multiply(mut self, num: u32) -> VMStateField {
          self.num = num as i32;
          self
      }
-
-    #[must_use]
-    pub const fn with_validate_flag(mut self) -> Self {
-        assert!(self.flags.0 == 0);
-        self.flags = VMStateFlags(VMStateFlags::VMS_MUST_EXIST.0 | VMStateFlags::VMS_ARRAY.0);
-        self.num = 0; // 0 elements: no data, only run test_fn callback
-        self
-    }
-
-    // FIXME: Unfortunately, this non-const fn cannot currently be called in a
-    // static context. Also, it can't be const because the compiler complains
-    // about "constant functions cannot evaluate destructors" for `F`. Add it
-    // for future vmstate builder.
-    #[must_use]
-    pub fn with_exist_check<T, F>(mut self, _cb: F) -> Self
-    where
-        F: for<'a> FnCall<(&'a T, u8), bool>,
-    {
-        assert!(self.field_exists.is_none());
-        let _: () = F::ASSERT_IS_SOME;
-
-        self.field_exists = Some(rust_vms_test_field_exists::<T, F>);
-        self
-    }
  }
  
  /// This macro can be used (by just passing it a type) to forward the `VMState`
@@ -572,9 +548,9 @@ const fn phantom__<T>(_: &T) -> ::core::marker::PhantomData<T> {
                  }
                  Some(test_cb_builder__::<$struct_name, _>(phantom__(&$test_fn)))
              },
+            flags: VMStateFlags(VMStateFlags::VMS_MUST_EXIST.0 | VMStateFlags::VMS_ARRAY.0),
              ..$crate::zeroable::Zeroable::ZERO
          }
-        .with_validate_flag()
      };
  }
  

Otherwise the series looks great, thanks!

Paolo


