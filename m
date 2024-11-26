Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tFyAn-0006Yr-8v
	for mharc-qemu-rust@gnu.org; Tue, 26 Nov 2024 11:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tFyAk-0006Y8-NH
 for qemu-rust@nongnu.org; Tue, 26 Nov 2024 11:12:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tFyAi-0000ZO-Va
 for qemu-rust@nongnu.org; Tue, 26 Nov 2024 11:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732637536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4093Wg8NQ3L+uAmVbCET8ogJ7LPm6PashZNP2AERg/c=;
 b=fZvDzp3AAUno8zq+S/eUDG4PaBbiVgOhoHCrOAGinhCXWvw81LzRjWXbO/LNq622RCzHbU
 NS5uNClPjsNORJpLuYRyJFonbkJjaDTSB6R1SHD7udNmyBWJyJ4i9+yqxBjuVN7OekeBH5
 FgZ0Z2UE+SwIEW4qDMFNo9mxIo7fIiY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-mhRtf_7jMR270qneyyAkuQ-1; Tue, 26 Nov 2024 11:12:09 -0500
X-MC-Unique: mhRtf_7jMR270qneyyAkuQ-1
X-Mimecast-MFC-AGG-ID: mhRtf_7jMR270qneyyAkuQ
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4349cda1899so20496695e9.0
 for <qemu-rust@nongnu.org>; Tue, 26 Nov 2024 08:12:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732637528; x=1733242328;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4093Wg8NQ3L+uAmVbCET8ogJ7LPm6PashZNP2AERg/c=;
 b=T2KdKlkDVbBTpImAZmpq/ilPqDaiSXOCiCrIR1R3rRDwelqvTfx7rQvFmB2V3NlIgf
 se9eZtyDMaBcWqcSk2jrVb96jwTthWFkvHhaq/tANCjqVP9ArzQoAOaezx9lcm8sgYgD
 8jaaBEzRROvg/sD/BJh0pMOyUGR0PVKfA2b89T19IG5NeW68JcrlusPvSycllR2C3JT+
 ZKB9yRHQ3XLyKDSU9LIU3/3UGNAY4GCidsCjD0CDYRk1+hvkoJ69aVspy58Jyt+wCyT9
 RjEiaZMLe17DnSqoPTzafVMpB0OJwACMp3PCLGx/cCm52I4eLIGwbx/bf98fS2AFdOhc
 fzqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl2IMjci+pPskSLTPsXVFATASTGUmsVA9QID5H7rfOi3tWLNer4GHPLpg017NmLZwi6VZjoteNSL8=@nongnu.org
X-Gm-Message-State: AOJu0Yw2qTm1YderXGaL+nVky/XNKO4+Aerdg2UPbkqpreVyEqKDWYuA
 b9gUb4qMTvBVbtIH+9uCcVUF0jkDDvhYIfRzPSHzWoQjzQYzNs2D6+Km8PRN7Gclt7om7lGclsG
 0F7ffr4YbkC/j/Wz1FWDPP5H1kKo8i2rK5JZ8UzeP6riD9SQQsp0=
X-Gm-Gg: ASbGnctCSgIJ88Gs11EEFKc4u+WKv9/8+o882DVLZCIg8bp5E4TnJ4qsvSq9UPv8BeX
 MyE+19Nd88zVFefl1bl9Lq3G5O/c4BQhF0rJBekePb3S2Pjar9E46w20QL8ImkeDgamlgio6paI
 aC271E4cnoNWryCyGHukH15f+Sky49ekyrz+deOex1zMgV+QnME17PRU/qxeKQzMJk6QEgalY1W
 FRm7DMMZqypa4M7C3WWpPQdMGHdeZ8VmuDyYlvDqqsZpFZCZYqgfg==
X-Received: by 2002:a05:600c:1990:b0:434:a555:d0d with SMTP id
 5b1f17b1804b1-434a5551bbamr30526695e9.29.1732637528252; 
 Tue, 26 Nov 2024 08:12:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQ++Mc8u3l8NOs6ZQ+mbeYDLsr3IvhF7lClVmeIbN+poPmk50mXY1vNC68GL5sUz+gD/TeFQ==
X-Received: by 2002:a05:600c:1990:b0:434:a555:d0d with SMTP id
 5b1f17b1804b1-434a5551bbamr30507515e9.29.1732637497928; 
 Tue, 26 Nov 2024 08:11:37 -0800 (PST)
Received: from [192.168.10.3] ([151.49.236.146])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-433b463ab44sm238573555e9.30.2024.11.26.08.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 08:11:37 -0800 (PST)
Message-ID: <1d0e1b5f-36ad-41d4-b526-260fa5cd0b34@redhat.com>
Date: Tue, 26 Nov 2024 17:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] rust: add BQL-enforcing Cell variant
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, junjie.mao@hotmail.com, qemu-rust@nongnu.org
References: <20241122074756.282142-1-pbonzini@redhat.com>
 <20241122074756.282142-2-pbonzini@redhat.com> <Z0XhhB48W4Nqagku@intel.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z0XhhB48W4Nqagku@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YPv6bzNDnm31DCjFE_HMf4MKlrlnj_FQPhD9IwMZT-c_1732637528
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 26 Nov 2024 16:12:18 -0000

On 11/26/24 15:56, Zhao Liu wrote:
>>> But this actually applies to _all_ of the device struct!  Once a
>>> pointer to the device has been handed out (for example via
>>> memory_region_init_io or qdev_init_clock_in), accesses to the device
>>> struct must not use &mut anymore.
> 
> is the final goal to wrap the entire DeviceState into the
> BQLRefCell as well?

Not all of it, but certainly parts of it.  For example, the
properties are not mutable so they don't need to be in the BqlRefCell. 
The parents (SysBusDevice/DeviceState/Object) also manage their 
mutability on their own.

The registers and FIFO state would be in q BqlRefCell; as an 
approximation I expect that if you migrate a field, it will likely be in 
a BqlRefCell.

For PL011, that would be something like

struct PL011Registers {
     pub flags: registers::Flags,
     pub line_control: registers::LineControl,
     pub receive_status_error_clear: registers::ReceiveStatusErrorClear,
     pub control: registers::Control,
     pub dmacr: u32,
     pub int_enabled: u32,
     pub int_level: u32,
     pub read_fifo: [u32; PL011_FIFO_DEPTH],
     pub ilpr: u32,
     pub ibrd: u32,
     pub fbrd: u32,
     pub ifl: u32,
     pub read_pos: usize,
     pub read_count: usize,
     pub read_trigger: usize,
}

and a single "regs: BqlRefCell<PL011Registers>" in PL011State.

>> QEMU's Big Lock (BQL) effectively turns multi-threaded code into
>> single-threaded code while device code runs, as long as the BQL is not
>> released while the device is borrowed (because C code could sneak in and
>> mutate the device).  We can then introduce custom interior mutability primitives
>> that are semantically similar to the standard library's (single-threaded)
>> Cell and RefCell, but account for QEMU's threading model.  Accessing
>> the "BqlCell" or borrowing the "BqlRefCell" requires proving that the
>> BQL is held, and attempting to access without the BQL is a runtime panic,
>> similar to RefCell's already-borrowed panic.
> 
> This design is very clever and clear!
> 
> But I'm a little fuzzy on when to use it. And could you educate me on
> whether there are any guidelines for determining which bindings should
> be placed in the BQLCell, such as anything that might be shared?

It's the same as normal Rust code.  If in Rust you'd use a Cell or a 
RefCell, use a BqlCell or a BqlRefCell.

Right now it's hard to see it because there are a lot of "bad" casts 
from *mut to &mut.  But once the right bindings are in place, it will be 
a lot clearer.  For example the pl011 receive callback (currently an 
unsafe fn) might look like this:

     pub fn receive(&mut self, buf: [u8]) {
         if self.loopback_enabled() {
             return;
         }
         if !buf.is_empty() {
             debug_assert!(buf.len() == 1);
             self.put_fifo(buf[0].into());
         }
     }

except that it would not compile because the receiver must be &self. 
Hence the need for the BqlRefCell<PL011Registers>, which lets you change 
it to

     pub fn receive(&self, buf: [u8]) {
         let regs = self.regs.borrow_mut();
         if regs.loopback_enabled() {
             return;
         }
         if !buf.is_empty() {
             debug_assert!(buf.len() == 1);
             regs.put_fifo(buf[0].into());
         }
     }

Likewise for the MemoryRegionOps.  Right now you have

     pub fn write(&mut self, offset: hwaddr, value: u64) {
         ...
     }

but it will become

     pub fn write(&self, offset: hwaddr, value: u64) {
         let regs = self.regs.borrow_mut();
         ...
     }

Or who knows---perhaps the body of PL011State::write could become 
PL011Registers::write, and PL011State will do just

     pub fn write(&self, offset: hwaddr, value: u64) {
         self.regs.borrow_mut().write(offset, value);
         self.update()
     }

You can already apply this technique to your HPET port using a "normal" 
RefCell.  You'd lose the BQL assertion check and your object will not be 
Sync/Send (this is technically incorrect, because the code *does* run in 
multiple threads, but with the current state of Rust in QEMU it's not a 
bad option), but apart from this it will work.

However if you have already written a vmstate, you'll have to disable 
the vmstate temporarily because the vmstate macros cannot (yet) accept 
fields within a BqlRefCell.  Personally I believe that disabling vmstate 
and experimenting with interior mutability is a good compromise.

Plus, speaking in general, "it does something in a different way than 
the pl011 device model" is a good reason to merge the HPET model earlier 
too. :)

>> +    #[inline]
>> +    pub fn replace(&self, val: T) -> T {
>> +        debug_assert!(bql_locked());
> 
> Could debug_assert() work? IIUC, it requires to pass `-C debug-assertions` to
> compiler, but currently we don't support this flag in meson...

Meson automatically adds -C debug-assertions unless you configure with 
-Db_ndebug=off, which we never do.  So debug_assert!() is always on in 
QEMU; whether to use it or assert!() is more of a documentation choice.

Paolo


