Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tTdMY-0002bv-Fd
	for mharc-qemu-rust@gnu.org; Fri, 03 Jan 2025 03:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tTdMM-0002a7-Gz
 for qemu-rust@nongnu.org; Fri, 03 Jan 2025 03:48:55 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tTdMJ-0007eS-5s
 for qemu-rust@nongnu.org; Fri, 03 Jan 2025 03:48:44 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso10184175f8f.1
 for <qemu-rust@nongnu.org>; Fri, 03 Jan 2025 00:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735894121; x=1736498921; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dnw69YT7DoNzg822LR/pg2ScQe8hvsPH8QgQBHxooSk=;
 b=jf4QqyfWXHP+ZmDKhKXHXPcw6r9zCIs5C8uIo7BYZXyhR+m6oh8VqTMi+Dh4ABWzg5
 tYvmTmP0jVdwwOk9WkNkqhowMJmzLZMUafynyG/lshdIySvP7+k+nwYvVf18TkoADYxt
 m8h166k1rUHSHqluVNIzyKtZ1hW1EJDydffhvrbXlbXxnB4X+3r11rYSfGORXf/5bgZL
 RJ/SJm6giqqorUZrTpJrKwwdDBhGf331VTg7oYGrAWSkXKikkQ2Col0mhGh7zJlkKTC9
 8Fm8AGCs7F/8mQFsqmMJlDe0sJ9VazaGHl86+GmltvxA0kZ+eH115PWoJVmECnP88Fu7
 fL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735894121; x=1736498921;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dnw69YT7DoNzg822LR/pg2ScQe8hvsPH8QgQBHxooSk=;
 b=bfvjlcrh2U1ejl6HIILnm4QonVroylcHZl0L76MwaHKmCUOCsDdtHJoNKnUrUbfBrW
 cclqE9T6i7Sd5UrwhZiewxpLssdFMtailj5EhBc3dyM+g/KKaTy013M80tgZPN7I3kPj
 dPZbQ0VeDKsy9CTrrJtZBtSxUGXr6c/y5S/1PzgkC0t7VabdI8N5MccoAP1Dzxv+bvXQ
 FV0IIWY+Ix+7Y7rnZ2+WilqmYaszdbnu+LMe3Ra00IHLpqmKo6p7yIX9tg7xEnjL94Mb
 Kpd3VchOokXVhMJ6kkLIOj4u7Z65wjA8zO1bi0Kc12KRmtf7BwQkSHPo5iVmSo1LIX8A
 3z2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK+0Dz0CetqDPaOirJclznItx0A9kg7qwcXdtCXHrzvV7sLn5Tq7DF1RTFjbtt5fCpwTFTjedwYgs=@nongnu.org
X-Gm-Message-State: AOJu0Yxkxu+9wuc2uA0wnUTcvzcavtutl+W6+DoqqMA9oA99fiTSiPob
 O2wzxuiknol9HdcF6e389dk9BTugsOK7oDCbXYRJGnCid7bDVzSbG3qyTnTc+Ns=
X-Gm-Gg: ASbGncun7QAhbmb+3uZt2oIPiGhpEuF2FjN528DYKR9rmmxE4gUggO9UMvjWTP0jHpa
 A9TPSxXUPYSOuCwtfn3JPXoKBo+/Kwrq6BmEyrtNX5yYAWuYBKedcnNjuBcHgNLj3omSZX0UjwW
 6bapqZ282zARVg8UaCo8ddAe43OPj27WeBKNA6I7R9zcmugqh41g4VW/KSFz/Wp7qmzWdSJLnK3
 qWtbHxaAIRLNG1TazgQ8/9HdwarcXNpqbNIgcbZlwyDEUI3U6fqeDZJUs59b3yYHgxBdci9QLnc
 wMqSSBSXy/kbst+Nn8Q4/mSO
X-Google-Smtp-Source: AGHT+IHSOFKbnJb/LVYLzoY4lVG/m8tkY+b/NDORf7yD1TmFLlbGVMjXwAf/tsu6dMDY8tMtPw+NHA==
X-Received: by 2002:a05:6000:1887:b0:388:c61d:43e4 with SMTP id
 ffacd0b85a97d-38a223f8368mr38837491f8f.45.1735894120881; 
 Fri, 03 Jan 2025 00:48:40 -0800 (PST)
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b11aecsm509026925e9.23.2025.01.03.00.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2025 00:48:39 -0800 (PST)
Message-ID: <50cc7499-d162-465e-b3a6-25636dfda2db@linaro.org>
Date: Fri, 3 Jan 2025 09:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 25/41] rust: qom: put class_init together from multiple
 ClassInitImpl<>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20241219083228.363430-1-pbonzini@redhat.com>
 <20241219083228.363430-26-pbonzini@redhat.com>
 <daea6757-a67b-45d5-bf2a-807fd9569a70@linaro.org>
 <Z3enuYCHnKuiANmv@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z3enuYCHnKuiANmv@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Jan 2025 08:48:55 -0000

+Markus, Daniel & Peter

On 3/1/25 10:02, Zhao Liu wrote:
>>> -/// # Safety
>>> -///
>>> -/// We expect the FFI user of this function to pass a valid pointer that
>>> -/// can be downcasted to type `DeviceClass`, because `T` implements
>>> -/// `DeviceImpl`.
>>> -pub unsafe extern "C" fn rust_device_class_init<T: DeviceImpl>(
>>> -    klass: *mut ObjectClass,
>>> -    _: *mut c_void,
>>> -) {
>>> -    let mut dc = ::core::ptr::NonNull::new(klass.cast::<DeviceClass>()).unwrap();
>>> -    unsafe {
>>> -        let dc = dc.as_mut();
>>> +impl<T> ClassInitImpl<DeviceClass> for T
>>> +where
>>> +    T: DeviceImpl,
>>> +{
>>> +    fn class_init(dc: &mut DeviceClass) {
>>>            if <T as DeviceImpl>::REALIZE.is_some() {
>>>                dc.realize = Some(rust_realize_fn::<T>);
>>>            }
>>>            if <T as DeviceImpl>::RESET.is_some() {
>>> -            bindings::device_class_set_legacy_reset(dc, Some(rust_reset_fn::<T>));
>>> +            unsafe {
>>> +                bindings::device_class_set_legacy_reset(dc, Some(rust_reset_fn::<T>));
>>
>> Pre-existing, but since it appears on this patch, Rust device models
>> should not implement this legacy interface.
> 
> Rust pl011 is just faithful to the C functionality, and it's really time
> to make the rust version drop the previous technical debt too!
> 
> But I think this patch is OK for now since using legacy interface is the
> most simplified approach, and next step we can consider how to convert
> it to the modern interface with proper rust binding (my initial thought
> tells me that there is at least some effort needed here to explore
> whether a simple resettable trait would be enough...).
> 
>> If a non-Rust parent
>> implements it, I think we should convert the non-Rust parent before
>> adding a Rust child. No clue how to check a parent don't implement
>> this interface in Rust.
> 
> For C side, I also didn't find some case to check parent's
> legacy_reset before device_class_set_legacy_reset().
> 
> Maybe we should add `assert(!dc->legacy_reset)` in
> device_class_set_legacy_reset()?
> 
> Similarly, device_class_set_parent_[realize|unrealize] are worth
> adding assert().
> 
> If you agree, I'd be happy to add assert() to these three functions as
> well. :-)
> 
>> Generally, we shouldn't access legacy API from Rust IMHO.
>>
>>> +            }
>>>            }
>>>            if let Some(vmsd) = <T as DeviceImpl>::vmsd() {
>>>                dc.vmsd = vmsd;
>>>            }
>>>            let prop = <T as DeviceImpl>::properties();
>>>            if !prop.is_empty() {
>>> -            bindings::device_class_set_props_n(dc, prop.as_ptr(), prop.len());
>>> +            unsafe {
>>> +                bindings::device_class_set_props_n(dc, prop.as_ptr(), prop.len());
>>> +            }
>>>            }
>>>        }
>>>    }
>>


