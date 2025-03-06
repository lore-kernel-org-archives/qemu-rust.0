Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tq8jr-0002vS-Bd
	for mharc-qemu-rust@gnu.org; Thu, 06 Mar 2025 05:46:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tq8jg-0002i5-NJ
 for qemu-rust@nongnu.org; Thu, 06 Mar 2025 05:45:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tq8jc-0001LF-GB
 for qemu-rust@nongnu.org; Thu, 06 Mar 2025 05:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741257947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2RljU9Zr10QDqicNQECmrUW4OwRQHr/PVy0Eh7KJRi8=;
 b=AF7PgyWOUNtNWohI4JH1bIDc8dI+HiqsWW84in8wO8NoT27Jd3mxS9HzuQHRc3MC1TSfiX
 job5GEgzz/13CGvNvasC5fa8js+Po54xlBFSIlI99/pxc0JR8JXQdI708rjn4ur2449VF1
 YFETZ1WF3qQfxePnQVSLrVQvvqvFQcE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-rrcUMmEKNoeWoiSRM1UWoA-1; Thu, 06 Mar 2025 05:45:25 -0500
X-MC-Unique: rrcUMmEKNoeWoiSRM1UWoA-1
X-Mimecast-MFC-AGG-ID: rrcUMmEKNoeWoiSRM1UWoA_1741257925
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43bcddbe609so4866765e9.3
 for <qemu-rust@nongnu.org>; Thu, 06 Mar 2025 02:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741257924; x=1741862724;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2RljU9Zr10QDqicNQECmrUW4OwRQHr/PVy0Eh7KJRi8=;
 b=OXQWH6Q9cz9unffotKp/9flesY93csa7nlBTWI4K6wFzV8oPEzZXIe0MuJy5036ktv
 7CTojQPTbWcZ1Ksx6Ce0diLO9inLlQpT8jFGWLqrfeTrtxaq7pf7B+780aZAFzbpARRx
 hx9y21vpp505OhEhQ7xu+y6VsNCt35nXkNSRsW+900NmswP8KJVcKHpp4vXCIdZ/DIKI
 IXvD1RPWTnTOu36tw7F5h3BHZxeP0ALL0nQEREAjUvEfgesEC8O33drBpENrWfybtXY8
 oEYYS1DVd/ILjbsoPdHKWz0XS26t9ZF+qOz/ySkNrrSh6jgbnW4yJ6nL2em7D+EXCvEP
 gTRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9pAE7bUYehDxkq5GAfWmjCGCp8Mox5cmn3mkGp5rNTSPOPzW0CQ7pkxLij1MBE/k2tSC04ICqu9w=@nongnu.org
X-Gm-Message-State: AOJu0YwbvZaEi/4+3DIuguwjShXU5H5mB8KPWdn7H+AYn54OAuPeKD/e
 evKQk2j7v5W+q64aQkBFspLxN5oOtHgH7DGOpg8fuDSrS0KyZNzBfo5Zyjj+NE8DYruE++zXkqG
 tBntgP8aGJHcrBA36aTSoKqx4qGZuQSHaWO8JZOPBgCZKibR8wcE7ydlmt3wNI1qw
X-Gm-Gg: ASbGncsdm8kcjKjnW+apstighgPc/NgyVg4RI05VvcsAvZh+tX0tSlTuLISPYY8gWQo
 ox+ToLm27vVs0EQhVd563gulbT9XQA9rq1V979luJ0/i+9z3ZVTTzOseF3Uiog22Zl0XLhUHyA8
 If38kpTIw4H4VJtdqs+Wd8bTMX2Go2OUjDpAYeAQqMFujhSGPiqFeHZ86S6p8leliwOrQifgtKx
 OrcjP4iMbBdeEzFNvm1PVMqdYv3DjgIulH1DxCc6JTDSGHdcYKcNB8blXOSjjOoopqBwtl1cQVl
 JihHd2KGSz/7GDpQmqc=
X-Received: by 2002:a05:600c:4f11:b0:439:916a:b3db with SMTP id
 5b1f17b1804b1-43bd292fee0mr62130735e9.6.1741257923719; 
 Thu, 06 Mar 2025 02:45:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEx6S3GRGnDVxfuUVsSupILL7H65IFBkgNm5JXCL3nK9b7LVnTBjD8g4+tbWGrdoYTDocXg6A==
X-Received: by 2002:a05:600c:4f11:b0:439:916a:b3db with SMTP id
 5b1f17b1804b1-43bd292fee0mr62130535e9.6.1741257923342; 
 Thu, 06 Mar 2025 02:45:23 -0800 (PST)
Received: from [192.168.10.48] ([151.95.119.44])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43bd42c6203sm46087855e9.24.2025.03.06.02.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 02:45:22 -0800 (PST)
Message-ID: <90a21eff-a7b4-41dd-99df-c36fd83a1c08@redhat.com>
Date: Thu, 6 Mar 2025 11:45:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] rust: timer: wrap QEMUTimer with Opaque<> and
 express pinning requirements
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250227142219.812270-1-pbonzini@redhat.com>
 <20250227142219.812270-5-pbonzini@redhat.com> <Z8WzRyPbt6d7CHWM@intel.com>
 <7b09b4e3-3c1f-4c94-ad3a-054eaf74f24c@redhat.com>
 <Z8bEN0HFbfMJ5rmm@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z8bEN0HFbfMJ5rmm@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F5J5JVJmu8tyqI4nyrL4sW51mkB-J97mgzeeBvOTx1s_1741257925
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Thu, 06 Mar 2025 10:45:55 -0000

On 3/4/25 10:13, Zhao Liu wrote:
>> -    const fn as_mut_ptr(&self) -> *mut Self {
>> -        self as *const Timer as *mut _
>> +    /// Create a `Timer` struct without initializing it.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// The timer must be initialized before it is armed with
>> +    /// [`modify`](Self::modify).
>> +    pub unsafe fn new() -> Self {
>> +        // SAFETY: requirements relayed to callers of Timer::new
>> +        Self(unsafe { Opaque::zeroed() })
> 
> We should use Opaque::uninit()? Because MaybeUninit::<bindings::QEMUTimer>::zeroed()
> marks the timer as initialized, which disables MaybeUninit's ability to check for
> initialization. e.g.,

While neither is good, a zeroed area of memory behaves better than an 
uninitialized one...  In particular, Drop calls timer_del() which works 
fine with a zeroed QEMUTimer.  With Opaque::uninit() you could have a 
crash just with

     drop(Timer::new());

> // No compiling error or runtime panic
> let t: MaybeUninit<bindings::QEMUTimer> = MaybeUninit::zeroed();
> let _t = unsafe { t.assume_init() };
> 
> Further more, I spent some time trying to figure out if MaybeUninit in
> Opaque<> could help identify UB caused by uninitialized Timer, but I found
> it doesn't work. :-(
> 
> // No compiling error or runtime panic
> let mut v: UnsafeCell<MaybeUninit<bindings::QEMUTimer>> = UnsafeCell::new(MaybeUninit::uninit());
> let _v = unsafe { v.get_mut().assume_init() };
> 
> But when I adjust MaybeUninit as the outer wrapper, the UB check can
> work:
> 
> // Runtime panic: Illegal instruction
> let v: MaybeUninit<UnsafeCell<bindings::QEMUTimer>> = MaybeUninit::uninit();
> let _v = unsafe { v.assume_init() };
> 
> Compared with linux's Opaque, it also puts MaybeUninit on the outermost
> layer.

Yes, I admit I just copied what Linux does. :)

> And there's another example:
> 
> https://doc.rust-lang.org/std/cell/struct.UnsafeCell.html#method.raw_get
> 
> Emm, I guess now we have UnsafeCell<MaybeUninit<>> because interior
> mutability is expected... but this layout breaks MaybeUninit's functionality.

Thanks for the example from the documentation!  Indeed it should be 
possible to do

     /// Returns a raw mutable pointer to the opaque data.
     pub const fn as_mut_ptr(&self) -> *mut T {
         UnsafeCell::raw_get(self.value.as_ptr())
     }

     /// Returns a raw pointer to the opaque data that can be passed to a
     /// C function as `void *`.
     pub const fn as_void_ptr(&self) -> *mut std::ffi::c_void {
         self.as_mut_ptr().cast()
     }

     pub const fn raw_get(slot: *const Self) -> *mut T {
         // SAFETY: even if uninitialized, slot points to a MaybeUninit
         let slot = slot.cast::<MaybeUninit<UnsafeCell<T>>>;
         UnsafeCell::raw_get(slot.as_ptr())
     }

if Opaque<> uses a MaybeUninit<UnsafeCell<T>>.  I'm a bit worried of 
deviating from what Linux does though...

Paolo


